class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.references :dealership, null: false, foreign_key: true
      t.string :name
      t.integer :status
      t.float :price

      t.timestamps
    end
  end
end
