class User < ActiveRecord::Base
  include Greetings
  serialize :greetings, JSON
  before_create :set_default_greetings

  def User.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def todays_birthdays
    month = Date.today.month.to_s.rjust(2, '0')
    day = Date.today.day.to_s.rjust(2, '0')
    fql = """
      SELECT name, uid
      FROM user
      WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me())
      AND strlen(birthday_date) != 0
      AND ((substr(birthday_date, 0, 2) = '#{month}'
      AND substr(birthday_date, 3, 2) = '#{day}'))
    """
    graph = Koala::Facebook::GraphAPI.new self.oauth_token
    birthdays = graph.fql_query(fql)
  end

  private
  def set_default_greetings
    self.greetings = DEFAULT_GREETINGS
  end

end
