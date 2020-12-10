require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :"/pirates/new"
    end

    post '/pirates' do
      #params: {"pirate"=>{"name"=>"Pineapple", "weight"=>"160", "height"=>"65",
      #{}"ships"=>[{"name"=>"Nina", "type"=>"Sailing", "booty"=>"Rubys"},
      #{"name"=>"Vacation", "type"=>"Racing", "booty"=>"Jetskis"}]}}
      @pirate = Pirate.new(params[:pirate])
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ship.all
      erb :"/pirates/show"
    end

  end
end
