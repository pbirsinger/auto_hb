module Greetings
  DEFAULT_GREETINGS = [
    "hb",
    "HB!",
    "Happy Birthday!",
    "Happy Birthday [NAME]!",
    "Wishing you a Happy Birthday!",
    "Have a great birthday!",
    "Have a great birthday [NAME]!",
    "happy birthday",
    "Happy Birthday",
    "Have an awesome birthday!",
    "Have an awesome birthday [NAME]!",
    "happy bday!!!!!",
    "HAPPY BDAY!!!!",
    "HAPPY B-DAY!",
    "happy birthday =)",
    "Happy Birthday, [NAME]!! :D",
    "happy bday",
    "haaaappy birthdaaaay",
    "Hope you're having a great birthday!",
    "Hope you're having a great birthday [NAME]!",
    "Have a wonderful birthday!",
    "HAPPY BIRTHDAY!!!"
  ]

  def insert_name(greeting, name)
    greeting.gsub("[NAME]", name)
  end
end

