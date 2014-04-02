class Reference < ActiveRecord::Base
    include ScandGenerator

    validates :year, numericality: true
    
    def generate_bibtex
        
    end
end
