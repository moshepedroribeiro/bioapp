class CreateReactor < ActiveRecord::Migration[7.2]
  def change
    create_table :reactors do |t|
      t.string :name, null: false
      t.string :code, null: false, index: { unique: true }
      t.datetime :activated_at

      t.timestamps
    end
  end
end
