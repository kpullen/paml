module Paml
	class Node
		attr_reader :level, :tag, :attributes, :content, :postamble
		def initialize options = {}
			@level = (options[:whitespace] || "").scan(/\t/).size
			@tag = options[:tag] || "div"

			@attributes = Hash[
					*(options[:attributes] || "")
					.split(",")
					.map {|kv| kv.split(":").map {|x| x.strip } }
					.flatten]
			@attributes["id"] = options[:id] if options[:id]
			@attributes["class"] = options[:class] if options[:class]

			@content = (options[:content] || "").strip
			@postamble = ""
		end
	end
end
