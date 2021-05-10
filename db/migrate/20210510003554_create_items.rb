class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :list, null: false, foreign_key: true
      t.text :description
      t.boolean :completed
      t.datetime :completed_at

      t.timestamps
    end
  end
end
