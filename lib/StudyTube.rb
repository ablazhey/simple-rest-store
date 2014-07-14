#require "StudyTube/version"
dir = File.dirname(__FILE__) 
require File.join(dir, './StudyTube/version')
require File.join(dir, './StudyTube/study_type')
require File.join(dir, './StudyTube/rest')
require File.join(dir, './StudyTube/files')
require File.join(dir, './StudyTube/rest_and_files')

module StudyTube
  $FILE = 'test.txt'

  class StudyTube
    attr_accessor :type

    def initialize type, file = nil
      @type = study_type(type)
      $FILE = file
    end

    def create key, value
      type.create(key,value)
    end

    def update key, value
      type.update(key,value)
    end

    def delete key
       type.delete(key)
    end

    def show key
       type.show(key)
    end

    def list
      type.list
    end


  private
    
    def study_type(type)
      case type
        when 'REST'
          Rest.new
        when 'FILES'
          Files.new
        when 'RestFiles'
          RestFile.new
        else
          Rest.new
      end


    end

  end

end