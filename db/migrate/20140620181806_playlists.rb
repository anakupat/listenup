class Playlists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :song_uri

      t.timestamps
    end
  end
end
