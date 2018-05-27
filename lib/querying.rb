# -- CREATE TABLE characters (  id INTEGER PRIMARY KEY, name TEXT, motto TEXT,  species TEXT,  author_id INTEGER,  series_id INTEGER);
# -- CREATE TABLE authors (id INTEGER PRIMARY KEY, name TEXT);
# -- CREATE TABLE subgenres ( id INTEGER PRIMARY KEY, name TEXT);
# -- CREATE TABLE books ( id INTEGER PRIMARY KEY, title TEXT, year INTEGER,  series_id INTEGER);
# -- CREATE TABLE series (id INTEGER PRIMARY KEY, title TEXT, author_id INTEGER,  subgenre_id INTEGER);
# -- CREATE TABLE character_books ( id INTEGER PRIMARY KEY,  character_id INTEGER, book_id INTEGER);


def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
   FROM books
   WHERE series_id = 1
   ORDER BY year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
   FROM characters
   ORDER BY length(motto) DESC
   LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, count(species) 
   FROM characters
   GROUP BY species
   ORDER BY count(species) DESC
   LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
   FROM authors
   JOIN series
   ON series.author_id = authors.id
   JOIN subgenres
   ON series.subgenre_id = subgenres.id;
"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
   FROM series
   JOIN characters
   ON series.id = characters.series_id
   WHERE characters.species = 'human'
   GROUP BY series.title
   ORDER BY COUNT(characters.species) DESC
   LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, books.series_id
   FROM characters
   JOIN series
   ON characters.series_id = series.id
   JOIN books 
   ON books.series_id = series.id;"
end
