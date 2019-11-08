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
    result_hash["properties"].each do |property|
      byebug
      property = Property.new(date: event["date"].split("/").join(''), event: event["description"])
      if newCard.valid? 
        newCard.save()
      else
        puts "card already exists"
      end 
    end 
  end 
end