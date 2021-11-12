class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t| 
      t.string :first_name
      t.string :last_name
      t.string :city_name
      t.string :gender
      t.string :category, array: true 
      t.integer :mobile_no 
      t.string :images
     

      t.timestamps
    end
  end
end
