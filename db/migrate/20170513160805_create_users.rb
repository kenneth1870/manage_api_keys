class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :token
      t.string :email
      t.integer :counter, default: 0

      t.timestamps
    end
  end
end
