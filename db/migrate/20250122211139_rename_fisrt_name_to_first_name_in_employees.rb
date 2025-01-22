class RenameFisrtNameToFirstNameInEmployees < ActiveRecord::Migration[8.0]
  def change
    rename_column :employees, :firts_name, :first_name
  end
end
