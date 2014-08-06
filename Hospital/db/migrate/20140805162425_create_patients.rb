class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string  :lastname
      t.string :firstname
      t.text :description
      t.datetime :dob
      t.binary :gender
      t.timestamps
    end
  end
end
