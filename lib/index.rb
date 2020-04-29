require 'pry'

library = [
  {title: "Dracula", author: "Bram Stoker", genres: ["Horror", "Gothic"], pages: 418, publication_year: 1897, completed: true},
  {title: "Slaughterhouse Five; or the Children's Crusade", author: "Kurt Vonnegut, Jr.", genres: ["Satire", "Science Fiction"], pages: 186, publication_year: 1969, completed: false},
  {title: "Frankenstein; or, the Modern Prometheus", author: "Mary Shelley", genres: ["Gothic", "Horror", "Science Fiction"], pages: 280, publication_year: 1818, completed: true},
  {title: "Circe", author: "Madeline Miller", genres: ["Historical Fiction", "Fantasy"], pages: 385, publication_year: 2018, completed: false},
  {title: "Inferno", author: "Dante Alighieri", genres: ["Epic"], pages: 261, publication_year: 1320, completed: true},
  {title: "Mastering the Art of French Cooking", author: "Simone Beck, Louisette Bertholie, Julia Child", genres: ["Cooking"], pages: 726, publication_year: 1961, completed: false},
  {title: "Animal Farm", author: "George Orwell", genres: ["Political Satire"], pages: 112, publication_year: 1945, completed: true},
  {title: "War and Peace", author: "Leo Tolstoy", genres: ["Historical Fiction"], pages: 1225, publication_year: 1869, completed: false},
  {title: "The Innovators: How a Group of Hackers, Geniuses, and Geeks Created the Digital Revolution", author: "Walter Isaacson", genres: ["Biography"], pages: 488, publication_year: 2014, completed: false},
  {title: "Twilight", author: "Stephanie Meyer", genres: ["Young Adult", "Fantasy", "Romance"], pages: 498, publication_year: 2005, completed: true},
  {title: "The Life of Washington", author: "Mason Weems", genres: ["Historical Fiction", "Biography"], pages: 264, publication_year: 1809, completed: false},
  {title: "The Travels of John Mandeville", author: "John Mandeville", genres: ["Historical Fiction", "Fantasy"], pages: 167, publication_year: 1371, completed: false},
  {title: "Gulliver's Travels; or, Travels into Several Remote Nations of the World. In Four Parts. By Kenuel Gulliverr, First a Sugeon, and tthen a Captain of Several Ships", author: "Jonathan Swift", genres: ["Political Satire", "Fantasy"], pages: 240, publication_year: 1726, completed: true}
]

# WRITE CODE BELOW HERE

def all_pages(library)
  library.reduce(0) do |pages, el|
    pages += el[:pages]
  end
end

def all_pages_read(library)
  library.reduce(0) do |pages, el|
    if (el[:completed])
      pages += el[:pages]
    else
      pages
    end
  end
end

def all_genres(library)
  library.map do |b|
    b[:genres]
  end.flatten.uniq
end

def books_read(library)
  library.select do |b|
    b[:completed]
  end
end

def completed_books_detail(library)
  puts "I've read #{num_books_read(library).length} books, totaling at #{all_pages_read(library)} pages."
end

def books_in_library(library)
  library.reduce([]) do |agg, el|
    agg.push("#{el[:title]} by #{el[:author]}")
  end
end

def books_by_year(library)
  sorted = library.sort do |a, b|
    a[:publication_year] - b[:publication_year]
  end
  books_in_library(sorted)
end

def books_with_subtitles(library)
  library.select do |b|
    b[:title].include?(";") || b[:title].include?(":")
  end
end

def books_primary_title(library)
  library.map do |b|
    if b[:title].include? (";")
      b[:title].slice(0..(b[:title].index(";")-1))
    elsif b[:title].include?(":")
      b[:title].slice(0..(b[:title].index(":")-1))
    else
      b[:title]
    end
  end
end

def highest_page_count(library)
  library.reduce() do |agg, el|
    if el[:pages] > agg[:pages]
      agg = el
    end
    agg
  end
end

def recommended_books(library, num)
  unread = library.select do |b|
    b[:completed] == false
  end
  sorted = unread.sort do |a, b|
    a[:pages] - b[:pages]
  end
  i = 0
  array = []
  while i < num
    book = sorted[i]
    array.push("You should read #{book[:title]} by #{book[:author]}; it's only #{book[:pages]} pages long!")
    i += 1
  end
  array
end

def recommended_books_by_genre(library, like, dislike)
  binding.pry
  liked = library.select do |b|
    !b[:genres].include?(dislike)
  end
  sorted = liked.sort do |a, b|
    if a[:genres].include?(like) && !b[:genres].include?(like)
      -1
    elsif a[:genres].include?(like) && b[:genres].include?(like)
      0
    else
      1
    end
  end
  sorted.map do |b|
    if (b[:genres].include?(like))
      "Since you like #{like}, you should read #{b[:title]} by #{b[:author]}!"
    else
      "I also recommend #{b[:title]} by #{b[:author]}."
    end
  end
end


# WRITE CODE ABOVE HERE


binding.pry

puts "Books!"
