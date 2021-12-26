class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :stripe_id
      t.string :status
      t.float :amount
      t.text :city
      t.text :country
      t.text :line1
      t.text :line2
      t.text :postal_code
      t.text :state

      t.timestamps
    end
    add_index :orders, :stripe_id, unique: true
  end
end
