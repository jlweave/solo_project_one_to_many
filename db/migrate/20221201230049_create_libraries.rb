class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :city
      t.boolean :computer_lab
      t.bigint :phone_number
      
      t.timestamps
    end
  end
end
