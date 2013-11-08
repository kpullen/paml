module Paml
	class Node
		def self.from_hash options
			options[:level] = (options[:whitespace] || "").scan(/\t/).size

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
			@children = []
			options = {
				level: 0,
				tag: "div",
				attributes: {},
				content: ""}.merge options
			@level = options[:level]
			@tag = Tag.new options[:tag], options[:attributes]
			@content = options[:content].strip
		end

		def level_up
			@level += 1
		end

		def to_s
			@tag.wrap_around [@content, @children.map(&:to_s)].flatten.join
		end

		def << child
			@children << child
		end
	end
end
