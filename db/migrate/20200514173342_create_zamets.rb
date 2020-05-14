class CreateZamets < ActiveRecord::Migration[6.0]
  def change
    create_table :zamets do |t|
      t.string :z_title
      t.text :z_body

      t.timestamps
    end
  end
end
