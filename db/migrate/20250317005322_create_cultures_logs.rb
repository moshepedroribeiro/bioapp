class CreateCulturesLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :culture_logs do |t|
      t.references :culture, null: false, foreign_key: true
      t.float :pressure, null: false
      t.float :oxygen, null: false
      t.float :temperature, null: false
      t.float :ph, null: false
      t.float :concentration, null: false
      t.boolean :contaminants, null: false, default: false

      t.timestamps
    end
  end
end
