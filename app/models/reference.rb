class Reference < ActiveRecord::Base
    include ScandGenerator
    
    def to_inproceedings_bib_str
        #required fields: AUTHOR, TITLE, BOOKTITLE, YEAR
        #optional fields: EDITOR, VOLUME/NUMBER, SERIES, PAGES, ADDRESS, MONTH, ORGANIZATION, PUBLISHER, NOTE, KEY
        retstr = "@INPROCEEDINGS{ author = " + "\"" + author + "\"" + ", title = " + "\"" + title + "\"" + ", booktitle = " + "\"" + booktitle + "\"" + ", year = " + "\"" + year + "\""
        if not editor
            retstr = retstr + ", editor = " + "\"" + editor + "\""
        end
        if not volume
            retstr = retstr + ", volume = " + "\"" + volume + "\""
        end
        if not number
            retstr = retstr + ", number = " + "\"" + number + "\""
        end
        if not series
            retstr = retstr + ", series = " + "\"" + series + "\""
        end
        if not pages
            retstr = retstr + ", pages = " + "\"" + pages + "\""
        end
        if not address
            retstr = retstr + ", address = " + "\"" + address + "\""
        end
        if not month
            retstr = retstr + ", month = " + "\"" + month + "\""
        end
        if not organization
            retstr = retstr + ", organization = " + "\"" organization + "\""
        end
        if not publisher
            retstr = retstr + ", publisher = " + "\"" + publisher + "\""
        end
        if not note
            retstr = retstr + ", note = " + "\"" + note + "\""
        end
        if not key
            retstr = retstr + ", key = " + "\"" + key + "\""
        end
        return retstr + "}"
    end
end
