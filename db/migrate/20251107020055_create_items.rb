class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.belongs_to :account, null: false, foreign_key: true

      t.string :name, null: false, index: true
      t.string :code, null: false, index: { unique: true }
      t.string :uuid, null: false, index: { unique: true }
      t.string :mood, null: false, index: true, default: "none"

      t.string :do, null: false, default: "do", index: true

      t.text :content, limit: 16.megabytes - 1

      t.datetime :must_at
      t.datetime :done_at
      t.datetime :fade_at
      t.datetime :fade_to

      t.integer :foos, null: false, default: 0
      t.integer :load, null: false, default: 0
      t.integer :fire, null: false, default: 0
      t.integer :mass, null: false, default: 0

      t.timestamps
    end

    change_table :items, bulk: true do |t|
      t.index [ :account_id, :code ], unique: true
      t.index [ :account_id, :uuid ], unique: true
      t.index [ :account_id, :mood ]
      t.index [ :account_id, :do ]
      t.index [ :account_id, :must_at ]
      t.index [ :account_id, :done_at ]
    end
  end
end
