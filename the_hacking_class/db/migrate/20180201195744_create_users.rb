class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :pseudo
      t.string :password
      t.string :email
      t.string :firstname
      t.string :lastname
      t.references :cour, foreign_key: true

      t.timestamps
    end
  end
end
