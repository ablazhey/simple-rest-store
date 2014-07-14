require 'fileutils'
require 'tempfile'

module StudyTube

class Files < StudyTubeType
    
    attr_accessor :out_file, :tmp

    def type
      'FILE'
    end

    def create key, value
      create_if_not_file
      @out_file.puts({key => value}.to_json)
      @out_file.close
    end

    def update key, value
      open_reading
      create_temp
      @out_file.each do |line|
         if line.include?("{\"#{key}\":\"")
           @tmp << {key => value}.to_json
         else
           @tmp << line
         end
      end
      @tmp.close
      FileUtils.mv(@tmp.path, $FILE)
      @out_file.close      
    end


    def delete key
      open_reading
      create_temp
      @out_file.each do |line|
         unless line.include?("{\"#{key}\":\"")
            @tmp << line
         end
      end
      @tmp.close
      FileUtils.mv(@tmp.path, $FILE)
      @out_file.close  

    end

    def show key
      open_reading
      response = Hash.new
      @out_file.each do |line|
          unless line.include?("{\"#{key}\":\"")
            response = JSON.parse(line)
         end
      end

      response.empty? ? response : false


    end


    def list
      open_reading
      response = []
      @out_file.each do |line|
          array_from_file = JSON.parse(line).first
          response << {"key" => array_from_file.first, "value" => array_from_file.last}
      end
      response
    end

  private
    
    def create_if_not_file
      @out_file = File.open($FILE, 'a')
    end

    def open_reading
      @out_file = File.open($FILE, 'r+')
    end

    def create_temp
       @tmp = Tempfile.new("studytmp")
    end

  end
end