class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :medication_id
      t.integer :patient_id
      t.text :instructions
      t.timestamps
    end
  end
end
