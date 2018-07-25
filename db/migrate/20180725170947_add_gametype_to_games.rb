class AddGametypeToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :gametype, :string
  end
end
