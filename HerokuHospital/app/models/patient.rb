class Patient < ActiveRecord::Base

  belongs_to :facility
  has_many :prescriptions, dependent: :destroy
  has_many :medications, through: :prescriptions
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :gender, presence: true
  # validates_date :date_of_birth, :on_or_before => lambda { Date.current }
  validates_date :dob, :on_or_before => lambda { Date.current }
  validates :description, presence: true

  include Workflow

  workflow do

    state :waiting do
      event :examine, transitions_to: :checkup
      event :scan, transitions_to: :xray
      event :operate, transitions_to: :surgery
      event :leave, transitions_to: :discharge
    end

    state :checkup do
      event :scan, transitions_to: :xray
      event :operate, transitions_to: :surgery
      event :pay, transitions_to: :billing
    end

    state :xray do
      event :examine, transitions_to: :checkup
      event :operate, transitions_to: :surgery
      event :pay, transitions_to: :billing
    end

    state :surgery do
      event :examine, transitions_to: :checkup
      event :scan, transitions_to: :xray
      event :pay, transitions_to: :billing
    end

    state :billing do
      event :leave, transitions_to: :discharge
    end

  end



end
