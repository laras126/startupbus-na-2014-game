class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :name
      t.float :ranking
      t.references :conductor
      t.timestamps
    end
  end
end
