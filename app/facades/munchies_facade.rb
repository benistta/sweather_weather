class MunchiesFacade
  class << self
    def find_location(location, food)
      MunchiesService.find_destination(location, food)
    end
  end
end
