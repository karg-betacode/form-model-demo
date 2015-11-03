class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :path
      t.timestamps null: false
    end
  end
end
