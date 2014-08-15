class CreateGameshelves < ActiveRecord::Migration
  def change
    create_table :gameshelves do |t|
      t.string :title
      t.integer :players
      t.float :playtime
      t.timestamps
    end
  end
end
