class CreateMeetupsTable < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :location, null: false
      table.string :description, null: false
      table.timestamps
    end

    add_index :meetups, :name, unique: true
  end
end
