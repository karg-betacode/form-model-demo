class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :file
      t.integer :folder_id
      t.string  :color_tag
      t.timestamps null: false
    end
  end
end
