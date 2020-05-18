class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :specialisation
      t.integer :availability
      t.string :username
      t.string :password
      t.string :salary
      t.timestamps
    end
  end
end
