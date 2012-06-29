# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    m = Movie.create(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  re = /#{e1}.*#{e2}/
  re.match(page.body)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(/, /)
  ratings.each do |rating|
    if uncheck
      step %Q[I uncheck "ratings_#{rating}"]
    else
      step %Q[I check "ratings_#{rating}"]
    end
  end
end

Then /I should see all of the movies/ do
  num_movies = Movie.count
  rows = page.all('table tr').count - 1 # Don't count header row
  rows.should == num_movies
end

