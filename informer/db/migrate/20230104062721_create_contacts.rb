class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.text :content, null: false

      t.timestamps
    end
  end
end
