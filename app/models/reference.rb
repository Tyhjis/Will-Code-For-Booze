class Reference < ActiveRecord::Base

    include ScandGenerator

    validates :year, numericality: true
    validates :key, uniqueness: true, presence: true
    validates :referencetype, presence: true

    def keygen
      generated_key += author(0..3).to_s
      generated_key += year.to_s
      generated_key += rand(0..99).to_s
      unless Inproceeding.all.find_by(key: generated_key).nil?
        generated_key = keygen()
      end
      generated_key
    end

    def to_bib_str
        
        retstr = "@" + referencetype.upcase + '{'

        unless author.nil? or author.empty?
            retstr = retstr + " author = " + '{' + author + '}'
        end
        unless title.nil? or title.empty?
            retstr = retstr + ", title = " + '{' + title + '}'
        end

        unless booktitle.nil? or booktitle.empty?
            retstr = retstr + ", booktitle = " + '{' + booktitle + '}'
        end
        if year
            retstr = retstr + ", year = " + '{' + year.to_s + '}'
        end
        unless editor.nil? or editor.empty?
            retstr = retstr + ", editor = " + '{' + editor + '}'
        end
        if volume
            retstr = retstr + ", volume = " + '{' + volume + '}'
        end
        if number
            retstr = retstr + ", number = " + '{' + number + '}'
        end
        unless series.nil? or series.empty?
            retstr = retstr + ", series = " + '{' + series + '}'
        end
        if pagestart and pageend
            retstr = retstr + ", pages = " + '{' + pagestart + "--" + pageend + '}'
        end
        unless address.nil? or address.empty?
            retstr = retstr + ", address = " + '{' + address + '}'
        end
        if month
            retstr = retstr + ", month = " + '{' + month + '}'
        end
        unless organization.nil? or organization.empty?
            retstr = retstr + ", organization = " + '{' + organization + '}'
        end
        unless publisher.nil? or publisher.empty?
            retstr = retstr + ", publisher = " + '{' + publisher + '}'
        end
        unless note.nil? or note.empty?
            retstr = retstr + ", note = " + '{' + note + '}'
        end
        unless annote.nil? or annote.empty?
            retstr = retstr + ", annote = " + '{' + annote + '}'        
        end
        unless chapter.nil? or chapter.empty?
            retstr = retstr + ", chapter = " + '{' + chapter + '}'        
        end
        unless crossref.nil? or crossref.empty?
            retstr = retstr + ", crossref = " + '{' + crossref + '}'        
        end
        unless edition.nil? or edition.empty?
            retstr = retstr + ", edition = " + '{' + edition + '}'
        end
        unless eprint.nil? or eprint.empty?
            retstr = retstr + ", eprint = " + '{' + eprint + '}'        
        end
        unless howpublished.nil? or howpublished.empty?
            retstr = retstr + ", howpublished = " + '{' + howpublished + '}'        
        end
        unless institution.nil? or institution.empty?
            retstr = retstr + ", institution = " + '{' + institution + '}'
        end
        unless journal.nil? or journal.empty?
            retstr = retstr + ", journal = " + '{' + journal + '}'
        end

        unless key.nil? or key.empty?
            retstr = retstr + ", key = " + '{' + key + '}'
        end

        if number
            retstr = retstr + ", number = " + '{' + number + '}'
        end

        unless school.nil? or school.empty?
            retstr = retstr + ", school = " + '{' + school + '}'        
        end
        unless url.nil? or url.empty?
            retstr = retstr + ", url = " + '{' + url + '}'
        end
        retstr = retstr + '}'
        generate_scands(retstr)
    end
end
#t.timestamps
#      t.string :author
#      t.string :title
#      t.string :booktitle
#                               t.integer :year
#      t.string :editor
#                               t.integer :volume
#      t.string :series
#                               t.integer :pagestart
#                               t.integer :pageend
#      t.string :address
#                               t.integer :month
#      t.string :organization
#      t.string :publisher
#      t.string :note

#add_column :references, :annote, :string
#    add_column :references, :chapter, :string
#    add_column :references, :crossref, :string
#    add_column :references, :edition, :string
#    add_column :references, :eprint, :string
#    add_column :references, :howpublished, :string
#    add_column :references, :institution, :string
#    add_column :references, :journal, :string
#    add_column :references, :key, :string
#                                                   add_column :references, :number, :integer
#    add_column :references, :school, :string
#    add_column :references, :referencetype, :string
#    add_column :references, :url, :string
