class AddPositionToPortfs < ActiveRecord::Migration[5.2]
  def change
    add_column :portfs, :position, :integer
  end
end
