require 'sidekiq-scheduler'

class PropertyAddWorker < PropertyWorker
  def perform
    process_request
  end

  def make_request
    response = RestClient.get('https://interview.domio.io/properties')
    data = JSON.parse(response)
  end 

  def process_request
    result_hash = make_request
    result_hash["properties"].each do |property|
      property_type = PropertyType.where(name: property["type"]).first_or_create
      
      prop = Property.where(uri_id: property["id"]).first_or_create do |p|
        p.base_price = property["base_price"], 
        p.property_type_id = property_type.id
      end
      
      property_record = PropertyRecord.create(
        property_id: prop.id, 
        dynamic_display_price: property["dynamicDisplayPrice"]
      )
    end 
  end 

  def createPropertyType 
  end 
end