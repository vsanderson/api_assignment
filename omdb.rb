#!/usr/bin/ruby

require 'simplehttp'
require 'json'
require 'ostruct'
require 'awesome_print'  # for debugging

# use awesome print instead of "puts"
# use "ap" instead of "puts"

# examples of using the simplehttp gem to query the omdb database
# this example searches by movie title


#set title
puts "what title to search for?"


title = gets

#set base url for omdb api
#omdb_url = "www.omdbapi.com/?"


# free key for vsanderson@me.com
# apply for own free key at www.omdbapi.com

omdb_url = "http://www.omdbapi.com/?i=tt3896198&apikey=68bb6536&"

#set search options for: title, short plot, include tomatoes ratings
single_omdb_search_options = "t=#{title}&plot=short&r=json&tomatoes=true"
single_omdb_search_options_by_id = "i=#{@id}&plot=short&r=json&tomatoes=true"

list_omdb_search_options = "s=#{title}&r=json"

#combine options and base url
title_single_full_url = omdb_url + single_omdb_search_options

list_full_url = omdb_url + list_omdb_search_options

# manually build full url with the "title" search field
url_works = "http://www.omdbapi.com/?i=tt3896198&apikey=68bb6536&t=#{title}&r=json"


response = SimpleHttp.get title_single_full_url 


# write to a local file
my_local_filename = "omdb" + "-content.json"
my_local_file = open(my_local_filename, "w")
    my_local_file.write(response)    
my_local_file.close

#turn the JSON into an object to make it easier to work with
obj = JSON.parse(response, object_class: OpenStruct)

response = JSON.parse(response)

# use awesome print to nicely format the JSON
ap response 

# use the converted JSON object to output a field
puts obj.Title 

puts "The title is " + response['Title']
puts "It was made in " + response['Year']
puts "The director was " + response['Director']




