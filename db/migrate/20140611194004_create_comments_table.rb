class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.integer :meetup_id, null: false
      table.integer :user_id, null: false
      table.string :body, null: false
      table.string :title
      table.timestamps
    end
  end
end
