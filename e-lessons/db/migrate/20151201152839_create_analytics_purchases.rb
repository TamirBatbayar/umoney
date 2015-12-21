class CreateAnalyticsPurchases < ActiveRecord::Migration
  def change
    create_table :analytics_purchases do |t|
      t.string :user_session
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
