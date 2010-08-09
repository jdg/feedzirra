module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with RSS feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    class RSS
      include SAXMachine
      include FeedUtilities
      element :title
      element :link, :as => :url
      element 'atom:link', :as => :hub_url, :value => :href, :with => {:rel => "hub"}
      element 'atom10:link', :as => :hub_url, :value => :href, :with => {:rel => "hub"}
      elements :item, :as => :entries, :class => RSSEntry

      attr_accessor :feed_url

      def self.able_to_parse?(xml) #:nodoc:
        xml =~ /\<rss|\<rdf/
      end
    end

  end
  
end