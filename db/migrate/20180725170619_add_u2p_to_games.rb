class AddU2pToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :u2points, :integer
  end
end
