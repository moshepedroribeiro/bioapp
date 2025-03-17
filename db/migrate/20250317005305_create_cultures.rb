class CreateCultures < ActiveRecord::Migration[7.2]
  def change
    create_table :cultures do |t|
      t.references :reactor, null: false, foreign_key: true
      t.references :microorganism, null: false, foreign_key: true
      t.date :culture_end_date, null: false
      t.datetime :activated_at

      t.timestamps
    end

    add_index :cultures, [:reactor_id, :microorganism_id, :culture_end_date], unique: true, name: 'index_cultures_on_reactor_microorganism_and_date'
  end
end
