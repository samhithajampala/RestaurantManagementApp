class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :mobile
      t.string :house_apt_no
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.string :username
      t.string :pwd

      t.timestamps
    end
  end
end
