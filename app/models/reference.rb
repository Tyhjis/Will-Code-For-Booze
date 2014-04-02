class Reference < ActiveRecord::Base

    include ScandGenerator

    validates :year, numericality: true
    
    def to_inproceedings_bib_str
        #required fields: AUTHOR, TITLE, BOOKTITLE, YEAR
        #optional fields: EDITOR, VOLUME/NUMBER, SERIES, PAGES, ADDRESS, MONTH, ORGANIZATION, PUBLISHER, NOTE, KEY
        #retstr = "@INPROCEEDINGS{ author = " + "\"" + author + "\"" + ", title = " + "\"" + title + "\"" + ", booktitle = " + "\"" + booktitle + "\"" + ", year = " + "\"" + #{year} + "\""
        retstr = "@INPROCEEDINGS{ author = " + "\"" + author + "\"" + ", title = " + "\"" + title + "\"" + ", booktitle = " + "\"" + booktitle + "\"" + ", year = " + "\"" + year.to_s + "\""
        unless editor.empty?
            retstr = retstr + ", editor = " + "\"" + editor + "\""
        end
        if volume
            retstr = retstr + ", volume = " + "\"" + volume + "\""
        end
        if number
            retstr = retstr + ", number = " + "\"" + number + "\""
        end
        unless series.empty?
            retstr = retstr + ", series = " + "\"" + series + "\""
        end
        if pagestart and pageend
            retstr = retstr + ", pages = " + "\"" + pagestart + "--" + pageend + "\""
        end
        unless address.empty?
            retstr = retstr + ", address = " + "\"" + address + "\""
        end
        if month
            retstr = retstr + ", month = " + "\"" + month + "\""
        end
        unless organization.empty?
            retstr = retstr + ", organization = " + "\"" + organization + "\""
        end
        unless publisher.empty?
            retstr = retstr + ", publisher = " + "\"" + publisher + "\""
        end
        unless note.empty?
            retstr = retstr + ", note = " + "\"" + note + "\""
        end
        retstr + "}"
    end
end
