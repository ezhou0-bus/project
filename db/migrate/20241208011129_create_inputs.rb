class CreateInputs < ActiveRecord::Migration[7.1]
  def change
    create_table :inputs do |t|
      t.string :receiver_name
      t.string :receiver_company
      t.string :receiver_email
      t.text :occasion
      t.text :topics
      t.text :additional_requests
      t.string :email_body
      t.integer :email_id

      t.timestamps
    end
  end
end
