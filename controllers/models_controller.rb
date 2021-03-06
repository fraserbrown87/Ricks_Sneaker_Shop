require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/brands.rb' )
require_relative( '../models/models.rb' )


get '/models' do # index
  @models = Model.all()
  erb ( :"models/index" )
end

get '/models/new' do # new
  @brands = Brand.all()
  erb( :"models/new" )
end

post '/models' do # create
  @models = Model.new( params )
  @models.save()
  redirect to "/models"
end

get '/models/:id' do # show
  @model_name = Model.find(params['id'].to_i)
  erb( :"models/show" )
end
