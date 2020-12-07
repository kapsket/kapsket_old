class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.text :name
      t.text :address_line_1
      t.text :address_line_2
      t.text :city
      t.text :state
      t.text :postal_code
      t.text :details
    end
  end
end
