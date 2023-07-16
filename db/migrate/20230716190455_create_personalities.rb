class CreatePersonalities < ActiveRecord::Migration[7.0]
  def change
    create_table :personalities do |t|
      t.string :first-name
      t.string :last-name
      t.string :email
      t.integer :contact-number

      t.timestamps
    end
  end
end
