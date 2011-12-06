module Spree
  AppConfiguration.class_eval do
    def searcher_class
      @searcher_class ||= SpreePlus::Search::Base
    end   
  end
end
