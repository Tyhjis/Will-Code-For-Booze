class Article < Reference

  validates :author, length: {minimum: 3}
  validates :title, length: {minimum: 3}
  validates :journal, length: {minimum: 3}
  validates :year, numericality: { greater_than_or_equal_to: 1800,
                                  less_than_or_equal_to: Date.today.year }

end
