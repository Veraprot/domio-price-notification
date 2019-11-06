class PokemonRemoveWorker < PokemonWorker
  def perform
    Post.destroy_all
  end
end