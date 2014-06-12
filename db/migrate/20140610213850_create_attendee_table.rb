class CreateAttendeeTable < ActiveRecord::Migration
  def change
    create_table :attendees do |table|
      table.integer :user_id, null: false
      table.integer :meetup_id, null: false
    end
    add_index :attendees, [:meetup_id, :user_id], unique: true
  end
end
