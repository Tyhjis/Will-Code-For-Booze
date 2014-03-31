class CreateInproceedings < ActiveRecord::Migration
  def change
    create_table :inproceedings do |t|

      t.timestamps
      t.string :author
      t.string :title
      t.string :booktitle
      t.integer :year
      t.string :editor
      t.integer :volume
      t.string :series
      t.integer :pagestart
      t.integer :pageend
      t.string :address
      t.integer :month
      t.string :organization
      t.string :publisher
      t.string :note

    end
  end
end
