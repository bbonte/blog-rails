class Tablepostsprofiles < ActiveRecord::Migration
  def change
    create_table :posts_profiles, id: false do |t|
      t.references :post
      t.references :profile
    end
  end
end
