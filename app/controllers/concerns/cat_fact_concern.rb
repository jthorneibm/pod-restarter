module CatFactConcern
    extend ActiveSupport::Concern

    included do
        def get_cat_fact(_)
            api = Faraday.get("https://catfact.ninja/fact").body
            puts "got the api"
            json = JSON.parse(api)
            puts "got the json"
            json.deep_symbolize_keys[:fact]
        rescue
            "Cats always land on their feet"
        end
    end
end