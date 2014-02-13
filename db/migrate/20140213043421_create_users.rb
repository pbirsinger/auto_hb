class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string :name
      t.string :greetings
      t.string :non_wishes
    end
  end
end
