require './lib/catalog'
require './lib/artist'
require './lib/album'

def main_menu
  p "Hello there!"
  puts "\n"
  p "If you would like to enter a new artist and cd to your catalog, enter 'n'"
  p "Enter 'a' to search for an artist by entering an album name"
  p "Enter 'b' to search for an album by entering an artist name"
  p "Enter 'l' to list all contents of the catalog"
  p "Enter 'x' to exit"
  user_input = gets.chomp

  if user_input == 'n'
    new_cd
  elsif user_input == 'a'
    artist_search
  elsif user_input == 'b'
    album_search
  elsif user_input == 'l'
    list
  elsif user_input == 'x'
    p "Later!"
  else
    p "Invalid input"
    puts "\n"
    main_menu
  end
end

def new_cd
  p "Enter an artist name"
  artist = gets.chomp
  p "Enter an album name for the artist"
  album = gets.chomp
  new_entry = Catalog.create(artist,album)
  p "Entry added!"
  puts "\n"
  main_menu
end

def artist_search
  p "Please enter an album"
  album_name = gets.chomp
  p Catalog.search_for_artist(album_name)
  puts "\n"
  main_menu
end

def album_search
  p "Please enter an artist"
  artist_name = gets.chomp
  p Catalog.search_for_album(artist_name)
  puts  "\n"
  main_menu
end

def list
  p "Here's the entire catalog:"
  Catalog.list_all
  puts "\n"
  main_menu
end

main_menu
