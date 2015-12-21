class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :detail
      t.integer :page_content_id

      t.timestamps null: false
    end
  end
end
