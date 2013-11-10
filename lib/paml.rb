require "paml/version"
require "paml/stream"
require "paml/node"
require "paml/tag"

module Paml
	HAML_PATTERN = /
		# In HAML, the whitespace between the beginning of a line and an
		# element definition determines the element's depth in the tree
		# generated from the haml source.
		^(?<whitespace>\s*)
		# A tag can be specified 
		(?:%(?<tag>\w+))?
		#
		(?:\#(?<id>\w+))?
		# The class of the element
		(?:\.(?<class>\w+))?
		# The element attributes
		(?:\{(?<attributes>.*?)\})?
		# The type of content
		(?<content_type>-|=)?
		# The content
		(?<content>.*?)$
	/x
end
