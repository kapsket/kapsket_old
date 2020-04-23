class AddCapRefToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :cap, foreign_key: true
  end
end
