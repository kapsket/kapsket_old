class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.text :name
      t.string :material

      t.timestamps
    end
  end
end
