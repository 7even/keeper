require_relative '../time_formatter'

module Web::Views::Dashboard
  class Index
    include Web::View
    include Web::Views::TimeFormatter
  end
end
