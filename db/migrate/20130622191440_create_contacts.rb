class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name,  null: false
      t.string :email, null: false
      t.string :comment

      t.timestamps
    end
  end
end
