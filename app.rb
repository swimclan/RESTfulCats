require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'restfulcats')

get '/' do
	@cat = Cat.create(:name => 'Franky', :breed => 'black').to_json
end


get '/api/cats' do
	Cat.all.to_json
end

get '/api/cats/:id' do
	Cat.find(params[:id]).to_json
end

post '/api/cats' do
	puts "params are: #{params}"
	Cat.create(:name => params[:name], :breed => params[:breed]).to_json
end

# never update the id of a model or table row
patch '/api/cats/:id' do
	if params.has_key?(:name) && params.has_key?(:breed)
		cat_args = { :name => params[:name], :breed => params[:breed] } 
	else
		cat_args = params[:name] || params[:breed]
	end
	@cat = Cat.find(params[:id])
	@cat.update(cat_args)
	@cat.to_json	
end

delete '/api/cats/:id' do
	Cat.find(params[:id]).destroy.to_json
end

