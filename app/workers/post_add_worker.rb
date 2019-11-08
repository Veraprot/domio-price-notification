require 'sidekiq-scheduler'

class PostAddWorker < PostWorker
  def perform
    puts "hello world"
    # CSV.foreach((csv_path), headers: true) do |pokemon|
    #   Pokemon.create(pokedex_id: pokemon[0], name: pokemon[1], height: pokemon[3], weight: pokemon[4])
    # end
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