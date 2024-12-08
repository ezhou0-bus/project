class CreateEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :emails do |t|
      t.string :receiver_name
      t.string :receiver_email

      t.timestamps
    end
  end
end
