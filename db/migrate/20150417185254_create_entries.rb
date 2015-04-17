class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
