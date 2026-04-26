class CreatePrescriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :prescriptions do |t|
      t.string :medicine_name, null: false
      t.text :notes
      t.date :next_delivery_date, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end

    add_index :prescriptions, :next_delivery_date
  end
end
