module FilmBuff
  class IMDb
    attr_accessor :locale

    include HTTParty
    include HTTParty::Icebox
    cache :store => 'memory', :timeout => 120

    base_uri 'https://app.imdb.com'
    default_params = {
      "api" => "v1",
      "app_id" => "iphone1_1",
      "timestamp" => Time.now.utc.to_i,
      "sig" => "app1_1"
    }

    def initialize
      @locale = "en_US"
    end

    public
    def find_by_id(imdb_id)
      result = self.class.get('/title/maindetails', :query => {
        :tconst => imdb_id, :locale => @locale
      }).parsed_response
      Title.new(result["data"])
    end

    def find_by_title(title)
      results = self.class.get_without_caching('/find', :query => {
        :q => title, :locale => @locale
      }).parsed_response
      find_by_id(results["data"]["results"][0]["list"][0]["tconst"])
    end
  end
end
