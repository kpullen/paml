require "paml/version"
require "paml/line"
require "paml/stream"
require "paml/node"
require "paml/tag"

module Paml
	PATTERN = /
		# In Paml, the whitespace between the beginning of a line and an
		# element definition determines the element's depth in the tree
		# generated from the haml source.
		^(?<whitespace>\t*)
		# A tag can be named by prepending the name with a percent sign (%).
		(?:%(?<tag>\w+))?
		# Paml provides a shortcut for specifying an element's ID.
		(?:\#(?<id>\w+))?
		# Paml also provides a shortcut for specifying an element's class.
		(?:\.(?<class>\w+))?
		# Arbitrary attributes can be given in a ruby-like fashion; simply separate
		# keys and values with a colon (:), seperate key-value pairs with a comma
		# (,), and wrap the whole thing in curly braces ({}).
		(?:\{(?<attributes>.*?)\})?
		# Content can be added to the end of a line, but if a tag name, id, or
		# class has been given you must specify the KIND of content at the end of
		# the line. If you give a dash (-) or equal-sign (=) then Paml will treat
		# your content as PHP code; the only difference is that anything after an
		# equal-sign will be echoed.
		(?<content_type>-|=)?
		# The content.
		(?<content>.*?)$
	/x

	def generate! stream, tree = Node::Root.new
		node = stream.next
		tree << node
		if stream.level > tree.level
			generate! stream, node 
		elsif stream.level == tree.level
			generate! stream, tree
		end
	rescue Stream::StreamIsEmpty => _
		tree.to_s
	end
end
