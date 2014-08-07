class ChangePrescriptionInstructionsToInstruction < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :instructions, :text
    add_column :prescriptions, :instruction, :text
  end
end
