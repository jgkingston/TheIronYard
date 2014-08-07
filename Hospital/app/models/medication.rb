class Medication < ActiveRecord::Base

  has_many :prescriptions
  has_many :patients, through: :prescriptions

  validates :name, presence: true

end
