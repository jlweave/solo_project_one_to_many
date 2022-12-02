class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :library
      t.string :name
      t.integer :IBN
      t.boolean :available

      t.timestamps
    end
  end
end
