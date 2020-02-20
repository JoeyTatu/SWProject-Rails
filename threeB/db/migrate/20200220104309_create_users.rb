class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fName
      t.string :lName
      t.string :email
      t.string :password_hash
      t.string :password_digest
      t.string :account_type

      t.timestamps
    end
  end
end
