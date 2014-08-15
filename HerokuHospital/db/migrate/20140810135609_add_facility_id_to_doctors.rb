class AddFacilityIdToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :facility_id, :integer
  end
end
