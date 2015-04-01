class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.column :body, :string
      t.column :to, :string
      t.column :from, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
