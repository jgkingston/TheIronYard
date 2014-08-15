class ChangeDateTimeToDate < ActiveRecord::Migration
  def change
    change_column :patients, :dob, :date
  end
end

=begin

  def change
    add_column :patients, :ward_id, :reference


class Ward
  has_many :patients
end
