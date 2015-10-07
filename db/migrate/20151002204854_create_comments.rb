class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :profile
      t.references :post

      t.datetime :deleted_at, null: true

      t.timestamps null: false
    end
  end
end
