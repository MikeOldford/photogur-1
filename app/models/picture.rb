class Picture < ActiveRecord::Base
	attr_accessible :title, :artist, :url, :copyrighted
	#Whitelist that allows mass-assignment for the attributes 
	#title and artist and url
	#don't confuse with attr_acccessor

	validates :title, :presence => true
	validates :url, {
		:format => {:with => /^https?:\/\//, :message => "Invalid URL format"}
	}
end