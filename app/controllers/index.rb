get '/' do
  "Things have begun"
 erb :"index"
end

get '/rainy_day' do
  erb :'rainy_day'
end