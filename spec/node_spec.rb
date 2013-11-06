require "spec_helper"
include Paml

describe Node do
	let(:single_mom) { parent = Node.new; parent << Node.new; parent }
	let(:has_attributes) { Node.new(attributes: "a: 1, b: 2") }

	it("has a level") { Node.new(whitespace: "\t").level.should eq 1 }
	it("only accepts tabs as whitespace") { Node.new(whitespace: " ").level.should eq 0 }

	it("is a div by default") { Node.new.tag.should eq "<div>" }

	it("has attributes") { has_attributes.attributes.should eq("a" => "1", "b" => "2") }
	it("will print its attributes") { has_attributes.tag.should eq "<div a='1' b='2'>" }
	it("will print its id") { Node.new(id: "asdf").tag.should eq "<div id='asdf'>" }
	it("will print it class") { Node.new(class: "asdf").tag.should eq "<div class='asdf'>" }

	it("has content") { Node.new(content: "hello").content.should eq "hello" }
	it("has blank content by default") { Node.new.content.should eq "" }

	it("has an opening tag") { Node.new(tag: "p").tag.should eq "<p>" }
	it("has a closing tag") { Node.new(tag: "p").postamble.should eq "</p>" }

	it("can become a string") { Node.new(tag: "p").to_s.should eq "<p></p>" }

	
	it("has children") do
		single_mom.children.size.should eq 1
	end

	it("will tell its children to become strings") do
		single_mom.to_s.should eq "<div><div></div></div>"
	end

end
