class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.column :number, :string
      t.column :name, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
