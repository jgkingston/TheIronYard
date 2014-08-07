class ChangeDateTimeToDate < ActiveRecord::Migration
  def change
    change_column :patients, :dob, :date
  end
end
