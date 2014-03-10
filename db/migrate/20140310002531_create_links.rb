class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.references :user, index: true
      t.string :url
      t.string :name
      t.boolean :checked, default: false
      t.text :description

      t.timestamps
    end
  end
end
