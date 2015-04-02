class ChangeTextContactRelationship < ActiveRecord::Migration
  def change
    create_table :contacts_texts, :id => false do |t|
      t.column :contact_id, :integer
      t.column :text_id, :integer

      t.timestamps
    end
  end
end
