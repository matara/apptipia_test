require 'rack/cache'
require 'sprockets'
require './web_ui/parcel_delivery'

use Rack::Cache

map '/assets' do
  run ParcelDelivery.assets
end

run ParcelDelivery