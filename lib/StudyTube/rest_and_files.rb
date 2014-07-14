module StudyTube


class RestFile < StudyTubeType

    URL_REST = "http://simple-rest-store.herokuapp.com/"
    def type
      'REST'
    end

    def create key, value
      begin
        RestClient.put URL_REST + key.to_s, value
        files = Files.new
        files.create key, value
      rescue
        false
      end
    end

    def update key, value
      begin
        RestClient.put URL_REST + key.to_s, value
        files = Files.new
        files.update key, value
      rescue
        false
      end
    end


    def delete key
      begin
        RestClient.delete URL_REST + key.to_s
        files = Files.new
        files.delete key
      rescue
        false
      end

    end

    def show key
      begin
        value = RestClient.get URL_REST + key.to_s
        files = Files.new
        "#{value}\n #{files.show(key)}"
      rescue
        false
      end
    end


    def list
      begin
      	files = Files.new
        files_rows = files.list
        rest_rows =  JSON.parse(RestClient.get URL_REST + "data")
        files_rows + rest_rows
      rescue
        false
      end

    end

  end

end