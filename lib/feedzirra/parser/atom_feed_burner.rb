module Feedzirra
  
  module Parser
    # == Summary
    # Parser for dealing with Feedburner Atom feeds.
    #
    # == Attributes
    # * title
    # * feed_url
    # * url
    # * entries
    class AtomFeedBurner
      include SAXMachine
      include FeedUtilities
      element :title
      element :link, :as => :url, :value => :href, :with => {:type => "text/html"}
      element :link, :as => :feed_url, :value => :href, :with => {:type => "application/atom+xml"}
      element :link, :as => :hub_url, :value => :href, :with => {:rel => "hub"}
      elements :entry, :as => :entries, :class => AtomFeedBurnerEntry

      def self.able_to_parse?(xml) #:nodoc:
        (xml =~ /Atom/ && xml =~ /feedburner/) || false
      end
    end

  end
  
end