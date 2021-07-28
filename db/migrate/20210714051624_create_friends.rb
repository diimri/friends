class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.string :FName
      t.string :LName
      t.string :Email
      t.string :Insta

      t.timestamps
    end
  end
end
