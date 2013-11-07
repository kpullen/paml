require "spec_helper"
include Paml

describe Node do
	let(:single_mom) { parent = Node.new; parent << Node.new; parent }
	let(:has_attributes) { Node.from_hash(attributes: "a: 1, b: 2") }

	it("has a level") { Node.from_hash(whitespace: "\t").level.should eq 1 }
	it("only accepts tabs as whitespace") { Node.from_hash(whitespace: " ").level.should eq 0 }

	it("is a div by default") { Node.new.intro.should eq "<div>" }

	it("will print its attributes") { has_attributes.intro.should eq "<div a='1' b='2'>" }
	it("will print its id") { Node.from_hash(id: "asdf").intro.should eq "<div id='asdf'>" }
	it("will print it class") { Node.from_hash(class: "asdf").intro.should eq "<div class='asdf'>" }

	it("has content") { Node.from_hash(content: "hello").content.should eq "hello" }
	it("has blank content by default") { Node.new.content.should eq "" }

	it("has an opening tag") { Node.new(tag: "p").intro.should eq "<p>" }
	it("has a closing tag") { Node.new(tag: "p").outro.should eq "</p>" }

	it("can become a string") { Node.new(tag: "p").to_s.should eq "<p></p>" }
	
	it("has children") { single_mom.children.size.should eq 1 }
	it("will tell its children to become strings") { single_mom.to_s.should eq "<div><div></div></div>" }
end
