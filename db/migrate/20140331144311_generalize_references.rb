class GeneralizeReferences < ActiveRecord::Migration
  def change
    rename_table :inproceedings, :references
  end
end
