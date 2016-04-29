# require gems
require 'sinatra'
require 'sqlite3'
require 'shotgun'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Release: 0: Add Routes
# 1. A /contact route that displays an address(make up the addy)
get '/contact' do
  "123 Fake Street."
end

# 2. A /great_job route that can take a person's name as a query parameter....
# http://localhost:4567/great_job/?name=Steve
get '/great_job/' do
name = params[:name]
  if name
  "Good job, #{name}!!"
  else
  "Good job!!"
  end
end

# 3. 
# http://localhost:4567/1/add/2
get '/:num1/add/:num2' do
  num1 = "#{params[:num1]}".to_i
  num2 = "#{params[:num2]}".to_i
  add = num1 + num2
  "#{add}"
end

# 4.




