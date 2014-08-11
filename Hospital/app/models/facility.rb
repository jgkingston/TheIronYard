class Facility < ActiveRecord::Base

  has_many :patients
  has_many :doctors

  validates :name, presence: true
  validates :description, presence: true
  validates :bed, presence: true

end
