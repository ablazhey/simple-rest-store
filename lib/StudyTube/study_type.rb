module StudyTube
  class StudyTubeType
    def type
      raise NotImplementedError, 'Ask the subclass'
    end
  end
end