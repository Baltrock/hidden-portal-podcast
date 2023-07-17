class CreatePersonalities < ActiveRecord::Migration[7.0]
  def change
    create_table :personalities do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :contact_number

      t.timestamps
    end
  end
end
