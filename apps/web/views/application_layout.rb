module Web
  module Views
    class ApplicationLayout
      include Web::Layout
      
      def projects
        ProjectRepository.all
      end
    end
  end
end
