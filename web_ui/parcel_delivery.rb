require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'haml'
require 'sprockets'
require 'sprockets-helpers'
require 'sprockets-sass'
require 'compass'

class ParcelDelivery < Sinatra::Base
  set :assets, Sprockets::Environment.new(root)

  configure do
    assets.append_path File.join(root, 'assets', 'stylesheets')
    assets.append_path File.join(root, 'assets', 'javascripts')
  end

  Sprockets::Helpers.configure do |config|
    config.environment = assets
    config.digest = true
    config.expand = true
    config.environment = assets
    config.prefix = '/assets'
  end

  Compass.configuration do |compass|
    compass.sprite_load_path = ['assets/images']
    compass.images_dir = 'assets'
    compass.generated_images_dir = 'public/assets'
  end

  helpers do
    include Sprockets::Helpers
  end

  before do
    cache_control :public, :must_revalidate, max_age: 60
  end

  get '/' do
    haml :content
  end

  get '/templates/:name' do
    haml :"templates/#{params[:name]}", layout: false
  end
end