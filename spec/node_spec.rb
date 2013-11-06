require "spec_helper"
include Paml

describe Node do
	it("has a level") { Node.new(whitespace: "\t").level.should eq 1 }
	it("only accepts tabs as whitespace") { Node.new(whitespace: " ").level.should eq 0 }
	it("has a tag") { Node.new(tag: "p").tag.should eq "p" }
	it("returns 'div' when no tag is specified") { expect(Node.new.tag).to eq "div" }
	it("has attributes") { expect(Node.new(attributes: "a: 1, b: 2").attributes).to eq("a" => "1", "b" => "2") }
	it("has content") { expect(Node.new(content: "hello").content).to eq "hello" }
	it("returns '' when no content is specified") { expect(Node.new.content).to eq "" }
end
