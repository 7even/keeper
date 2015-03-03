module Web::Views::Dashboard
  class Index
    include Web::View
    
    def format_time(time)
      time.strftime('%b %e %H:%M')
    end
    
    def time_to_words(time)
      ::TimeLord::Time.new(time).period.to_words
    end
  end
end
