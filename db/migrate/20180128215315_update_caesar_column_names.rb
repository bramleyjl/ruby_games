class UpdateCaesarColumnNames < ActiveRecord::Migration[5.1]
  def change
    drop_table :caesars

    create_table :caesars do |t|
      t.string :message
      t.integer :key
      t.string :code

      t.timestamps
    end
  end
end
