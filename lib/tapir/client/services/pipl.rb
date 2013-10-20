module Client
module Pipl
  class ApiClient
    include Client::Web

    attr_accessor :service_name
    
    def initialize
      @service_name = "pipl"  
    end

    def search(search_type, email)
      response = make_web_request(_get_uri(search_type, email))
      JSON.parse response if response
    end

    private

    def _get_uri(type, key)
      if type == :email
        "http://api.pipl.com/search/v3/json/?email=#{key}&exact_name=0&query_params_mode=and&key=#{_api_key}"
      elsif type == :phone
        "http://api.pipl.com/search/v3/json/?phone=#{key}&exact_name=0&query_params_mode=and&key=#{_api_key}"
      elsif type == :username
        "http://api.pipl.com/search/v3/json/?username=#{key}&exact_name=0&query_params_mode=and&key=#{_api_key}"
      else
        raise "Unknown search type"
      end
    end

    def _api_key 
      Setting.where({:name=>"pipl_api"}).first.value 
    end

  end
end
end