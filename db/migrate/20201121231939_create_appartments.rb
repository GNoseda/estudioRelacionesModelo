class CreateAppartments < ActiveRecord::Migration[6.0]
  def change
    create_table :appartments do |t|
      t.integer :number
      t.belongs_to :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
