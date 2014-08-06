class Patient < ActiveRecord::Base
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :gender, presence: true
  # validates_date :date_of_birth, :on_or_before => lambda { Date.current }
  validates_date :dob, :on_or_before => lambda { Date.current }
  validates :description, presence: true
end
