class ChangeFacilitiesBedsToBed < ActiveRecord::Migration
  def change
    remove_column :facilities, :beds, :integer
    add_column :facilities, :bed, :integer
  end
end
