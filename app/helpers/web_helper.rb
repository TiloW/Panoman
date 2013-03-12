# coding: utf-8

require 'net/http' 


module WebHelper
  
  def self.valid_url?(url)
    begin
      case Net::HTTP.get_response(URI.parse(url))
      when Net::HTTPSuccess
        true
      else  
        false
      end
    rescue
      false
    end
  end
  
end
