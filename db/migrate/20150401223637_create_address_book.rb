class CreateAddressBook < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.string :title
      t.integer :contact_id
    end
  end
end
