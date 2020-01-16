require 'sinatra'
# get is get http request
# within do end is response
# after updated n run again, need to control C to run .rb and refresh page

# route number1
# request and response

# / is home page

require 'sinatra/reloader' #reload the server when you save file

get '/'do # request
# file = IO.read('./index.html').gsub('home','back')
# return file
# after create erb,use this built in method for ruby
erb(:home)
# convention - inside the views folder
end

get '/burgers' do #request
  name = 'pokerface'
  "<h1> hi #{name} here is your" + ":hamburger:</h1>"  # response
  # "<h1>here is your" + ":hamburger:<h1>" ,can use this one, but normally no html way
end
 
# route number 2
get '/about' do
  "<p>hi welcome to burgulator!</p>"
end
# http://localhost:4567/about request and call function and reponse, if request link then show the about message inside
# everything inside browser is string

# get '/hello' do
#   p params
#   # params will get hash in the terminal when user request the name{"name"=>"dt"}
#   "hello #{params["name"]}"
#   # "hello #{params[:name]}" this one can work 
# end

# get '/hello' do
#   username = params[:name]
#   erb(:hello_there,locals: {name: username})

# end


get '/hello' do
  @name = params[:name]
  @magic = 400
  erb(:hello_there)

end

# http://localhost:4567/hello?name=dt , params = {"name" => "dt"}it shows html on browser

# http://localhost:4567/hello?addnum1=5&num2=3, params = {"num1" => "2", "num2" => "3"}

# expect 2 numbers as querystrings
get '/add' do
  @total = params[:num1].to_i + params[:num2].to_i
erb(:add_num)
end

# http://localhost:4567/add?num1=3&num2=4    output7

get '/random_color'do
colors = ["mistyrose","red","voilet"]
@color = colors.sample
erb(:color)
end
# every time run new code , need to open ruby main.rb
