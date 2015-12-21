class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :secret_key
      t.string :name
      t.string :email
      t.text :detail

      t.timestamps null: false
    end
  end
end
