class AddAllColumnsToReference < ActiveRecord::Migration
  def change
    add_column :references, :annote, :string
    add_column :references, :chapter, :string
    add_column :references, :crossref, :string
    add_column :references, :edition, :string
    add_column :references, :eprint, :string
    add_column :references, :howpublished, :string
    add_column :references, :institution, :string
    add_column :references, :journal, :string
    add_column :references, :key, :string
    add_column :references, :number, :integer
    add_column :references, :school, :string
    add_column :references, :referencetype, :string
    add_column :references, :url, :string
  end
end
