require 'sinatra'
require 'mongo'


mongo = Mongo::MongoClient.new
db = mongo['test']
coll = db['orders']

configure :development do
  set :bind, '0.0.0.0' #ok to listen to anybody
  set :port, 3000  #use localhost:3000
end

get '/' do
  erb :home
end

get '/select_food' do
  coll.insert({appetizer: params[:appetizer], entree: params[:entree], dessert: params[:dessert]})
  @orders=coll.find()
  erb :order
  #  "#{params}"  If didn't create separate order view page could just print param here to see if order submission worked.r

end
