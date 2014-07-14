require 'rest_client'

module StudyTube

class Rest < StudyTubeType

    URL_REST = "http://simple-rest-store.herokuapp.com/"
    def type
      'REST'
    end

    def create key, value
      begin
        RestClient.put URL_REST + key.to_s, value
      rescue
        false
      end
    end

    def update key, value
      begin
        RestClient.put URL_REST + key.to_s, value
      rescue
        false
      end
    end


    def delete key
      begin
        RestClient.delete URL_REST + key.to_s
      rescue
        false
      end

    end

    def show key
      begin
        RestClient.get URL_REST + key.to_s
      rescue
        false
      end
    end


    def list
      begin
        JSON.parse(RestClient.get URL_REST + "data")
      rescue
        false
      end

    end

  end

end