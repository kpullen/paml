module Paml
	class Line
		attr_accessor :level, :tag, :content_type, :content, :attributes
		def initialize options = {}
			options = {
				whitespace: "",
				tag: "div",
				content_type: "",
				content: ""}.merge options

			@level = options[:whitespace].scan(/\t/).size
			@tag = options[:tag].strip
			@content_type = :plain
			@content = options[:content]

			@attributes = Hash[
					*(options[:attributes] || "")
					.split(",")
					.map {|kv| kv.split(":").map {|x| x.strip } }
					.flatten]
			@attributes[:id] = options[:id] if options[:id]
			@attributes[:class] = options[:class] if options[:class]
		end
	end
end
