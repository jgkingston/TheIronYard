class Doctor < ActiveRecord::Base

  belongs_to :facility
  has_many :appointments
  has_many :patients, through: :appointments


end
