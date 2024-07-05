class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthdate
      t.string :username
      t.string :email
      t.string :phonenumber

      t.timestamps
    end
  end
end
