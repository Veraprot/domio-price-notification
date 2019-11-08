require 'sidekiq-scheduler'

class PropertyAddWorker < PropertyWorker
  def perform
    puts "hello world"
  end

  def make_request
    response = RestClient.get('https://interview.domio.io/properties')
    data = JSON.parse(response)
  end 

  def process_request
    result_hash = make_request
    byebug
    result_hash["properties"].each do |property|
      puts property
    end 
  end 
end