class PostAddWorker < PostWorker
  def perform(path)
    make_request
    # CSV.foreach((csv_path), headers: true) do |pokemon|
    #   Pokemon.create(pokedex_id: pokemon[0], name: pokemon[1], height: pokemon[3], weight: pokemon[4])
    # end
  end

  def make_request
    response = RestClient.get('https://jsonplaceholder.typicode.com/posts')
    data = JSON.parse(response)
  end 

  def process_request
    result_hash = make_request
    result_hash["properties"].each do |property|
      puts property
    end 
  end 
end