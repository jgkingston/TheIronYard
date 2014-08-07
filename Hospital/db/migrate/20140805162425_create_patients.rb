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

# rails g migration <name>

# e.g.

# rails g migration add_workflow_state_to_cars:string

#shortcut

# rails g migration method_field_to_table

=begin
  
 add_column :cars, :workflow_state, :string

 method :table, :field, :type
  
end
