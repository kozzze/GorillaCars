class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :firts_name
      t.string :last_name
      t.integer :salary

      t.timestamps
    end
  end
end
