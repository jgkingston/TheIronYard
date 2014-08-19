class Facility < ActiveRecord::Base

  has_many :patients, dependent: :destroy
  has_many :doctors, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :bed, presence: true

  def self.search query
    where("name like ?", "%#{query}%") 
  end

end
