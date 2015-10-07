class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.date :birthdate
      t.string :avatar
      t.references :user

      t.datetime :deleted_at, null: true

      t.timestamps null: false
    end
  end
end
