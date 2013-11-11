require "paml/version"
require "paml/line"
require "paml/stream"
require "paml/node"
require "paml/tag"

module Paml
	# I am the Regex pattern that parses individual lines of Paml source.
	PATTERN = /
		# In Paml, the whitespace between the beginning of a line and an
		# element definition determines the element's depth in the generated
		# tree.
		^(?<whitespace>\t*)
		# A tag can be named by prepending the name with a percent sign (%).
		# You may skip adding an element's tag name when the tag name is "div" if
		# you give at least an ID or class name.
		(?:%(?<tag>\w+))?
		# Paml provides a shortcut for specifying an element's ID.
		(?:\#(?<id>\w+))?
		# Paml also provides a shortcut for specifying an element's class.
		(?:\.(?<class>\w+))?
		# Arbitrary attributes can be given in a ruby-like fashion; simply separate
		# keys and values with a colon (:), seperate key-value pairs with a comma
		# (,), and wrap the whole thing in curly braces ({}). The attributes are
		# converted to HTML attributes and copied into the element's opening tag.
		(?:\{(?<attributes>.*?)\})?
		# Content can be added to the end of an element defintion but if the
		# content is PHP code then you must tell Paml what to do with it: A dash
		# (-) is used to tell Paml that the rest of the line is a bit of PHP code
		# that should be executed but not necessarily echo'd; an equality sign (=)
		# tells Paml that the rest of the line is PHP, and that it should be
		# echo'd. Consider this a shortcut to sprinkling `echo` all over your code. 
		(?<content_type>-|=)?
		# Everything after the element and content type definition is considered
		# content. The content may be copied directly into the output or, if a
		# content type is given, processed as PHP.
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
