class Patient < ActiveRecord::Base

  # include Workflow

  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :gender, presence: true
  # validates_date :date_of_birth, :on_or_before => lambda { Date.current }
  validates_date :dob, :on_or_before => lambda { Date.current }
  validates :description, presence: true

=begin
  workflow do

    state :initial_state do
      event :method, transitions_to: :end_state
      event :method, tansitions_to :end_state
    end

    state :summatelse do

    end

  end

=end

end
