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

  def process_request(begin_date, end_date)
    result_hash = make_request(begin_date, end_date)
    result_hash["result"]["event"].each do |event|
      newCard = Card.new(date: event["date"].split("/").join(''), event: event["description"])
      if newCard.valid? 
        newCard.save()
      else
        puts "card already exists"
      end 
    end 
  end 
end