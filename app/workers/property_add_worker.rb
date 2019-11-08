require 'sidekiq-scheduler'

class PropertyAddWorker < PropertyWorker
  def perform
    process_request
  end

  def make_request
    response = RestClient.get('https://interview.domio.io/properties')
    data = JSON.parse(response)
  end 

  {
    "basePrice"=>6000.06, 
   "dynamicDisplayPrice"=>6150.06, "id"=>"410e409f-ac02-4afb-bbbe-8b7ff708647f",
    "type"=>"home"
    }

  def process_request
    result_hash = make_request
    property_type_cache = {}
    result_hash["properties"].each do |property|
      byebug
      if(!property_type_cash.property["type"]) {
        property = property.find(name: property["type"])
      } else {
        property_type_cache[property["type"]] = true
        property_type = PropertyType.new(name: property["type"])
        property_type.children.build(:name => "123")
      }
    end 
  end 

  def createPropertyType 
  end 
end