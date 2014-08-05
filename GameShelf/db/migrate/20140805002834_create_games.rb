class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text  :description
      t.integer :minplayers
      t.integer :maxplayers
      t.timestamps
    end
  end
end
