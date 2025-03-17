class CreateMicroorganism < ActiveRecord::Migration[7.2]
  def change
    create_table :microorganisms do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }
      t.bigint :desired_pressure, null: false
      t.bigint :desired_oxygen, null: false
      t.bigint :desired_temperature, null: false
      t.bigint :desired_ph, null: false
      t.datetime :activated_at

      t.timestamps
    end
  end
end
