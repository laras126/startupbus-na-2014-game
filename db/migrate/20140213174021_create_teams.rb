class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :website
      t.string :twitter_handle
      t.string :facebook_url
      t.string :github_url
      t.text :description
      t.timestamps
    end
  end
end

