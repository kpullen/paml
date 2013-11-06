require "spec_helper"
include Paml

describe Node do
	it("has a level") { Node.new(whitespace: "\t").level.should eq 1 }
	it("only accepts tabs as whitespace") { Node.new(whitespace: " ").level.should eq 0 }

	it("is a div by default") { Node.new.tag.should eq "<div>" }

	it("has attributes") { Node.new(attributes: "a: 1, b: 2").attributes.should eq("a" => "1", "b" => "2") }

	it("has content") { Node.new(content: "hello").content.should eq "hello" }
	it("has blank content by default") { Node.new.content.should eq "" }

	it("has an opening tag") { Node.new(tag: "p").tag.should eq "<p>" }
	it("has a closing tag") { Node.new(tag: "p").postamble.should eq "</p>" }
end
