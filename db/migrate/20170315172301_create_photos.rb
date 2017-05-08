class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :lead, foreign_key: true, index: true

      t.string :image_uid
      t.string :title

      t.timestamps
    end
  end
end
