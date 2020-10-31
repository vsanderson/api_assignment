require "open-uri"
require "awesome_print"
require "simplehttp"

remote_base_url = "https://en.wikipedia.org/w/api.php?action=query"

puts "What subject to search for?"

topic = gets

# concatentate the topic to search for into the title part of the URL
title = "&titles=#{topic}"

# setup wiki search properties
prop = "&prop=revisions"
rvprop = "&rvprop=content"
format = "&format=json"

# build the url with query and search options
remote_full_url = remote_base_url + prop + rvprop + title + format 

# read the page at URL
pages = open(remote_full_url).read

simple_pages = SimpleHttp.get remote_full_url
ap simple_pages

my_local_filename = "wiki" + "-content.json"
my_local_file = open(my_local_filename, "w")
    my_local_file.write(pages)    
my_local_file.close
   
