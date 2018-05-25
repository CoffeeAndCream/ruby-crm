class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :lead, foreign_key: true, index: true
      t.string :image_uid

      t.timestamps
    end
  end
end
