class CreateCaps < ActiveRecord::Migration[5.2]
  def change
    create_table :caps do |t|
      t.text :name
      t.string :company

      t.timestamps
    end
  end
end
