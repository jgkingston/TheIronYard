class Medication < ActiveRecord::Base

  has_many :prescriptions, dependent: :destroy
  has_many :patients, through: :prescriptions

  validates :name, presence: true

  def self.search query
    where("name like ?", "%#{query}%") 
  end

end
