class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :unique_id
      t.integer :money

      t.timestamps null: false
    end
  end
end
