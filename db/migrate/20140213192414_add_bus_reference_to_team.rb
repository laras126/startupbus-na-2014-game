class AddBusReferenceToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :bus_id, :integer
    add_index :teams, :bus_id
  end
end
