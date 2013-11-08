module Paml
	# I am a Node in the Paml parse tree.
	# I have an indentation level.
	# I may have children; I'll adopt anyone you send me via #<<
	class Node

		# Construct a node from a hash of options.
		# A suitable subclass of Node may chosen.
		def self.from_hash options
			# Parse the whitespace into a depth level.
			# Nodes can only be indented by tabs.
			options[:level] = (options[:whitespace] || "").scan(/\t/).size

			# Parse the attributes string into a hash,
			# and shove the id and class in there, if they exist.
			options[:attributes] = Hash[
					*(options[:attributes] || "")
					.split(",")
					.map {|kv| kv.split(":").map {|x| x.strip } }
					.flatten]
			options[:attributes]["id"] = options[:id] if options[:id]
			options[:attributes]["class"] = options[:class] if options[:class]

			self.new options
		end

		attr_reader :level, :children
		def initialize options = {}
			@level = options[:level] || 0

			tag = options[:tag] || "div"
			attributes = options[:attributes] || {}
			spacer = " " unless attributes.empty?
			formatted_attributes = attributes
					.map {|k, v| "#{k}='#{v}'"}
					.join(" ")
					.strip

			@intro = "<#{tag}#{spacer}#{formatted_attributes}>"
			@outro = "</#{tag}>"
			@content = (options[:content] || "").strip
			@children = []
		end

		def level_up
			@level += 1
			self
		end

		def to_s
			[@intro, @content, @children.map(&:to_s), @outro].flatten.join
		end

		def << child
			@children << child
		end
	end
end
