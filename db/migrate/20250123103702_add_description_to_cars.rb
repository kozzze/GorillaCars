class AddDescriptionToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :description, :text
  end
end
