require_relative '../time_formatter'

module Web::Views::Projects
  class Show
    include Web::View
    include Web::Views::TimeFormatter
  end
end
