class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false, limit: 100
      t.string :code, null: false, limit: 20, index: { unique: true }
      t.string :uuid, null: false, limit: 36, index: { unique: true }
      t.string :mood, null: false, limit: 8, default: 'none', index: true

      t.timestamps
    end
  end
end
