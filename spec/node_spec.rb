require "spec_helper"
include Paml

describe Node do
	context "when constructing nodes" do
		context "when accepting pre-element whitespace" do
			it("accepts tabs") { expect(Node.from_hash(whitespace: "\t").level).to eq 1 }
			it("doesn't accept spaces") { expect(Node.from_hash(whitespace: " ").level).to eq 0 }

			subject { Node.from_hash attributes: "a: 1, b: 2" }
			it("parses an attribute string") { expect(subject.to_s).to eq "<div a='1' b='2'></div>" }
		end

		context "when using defaults" do
			it("is a div") { expect(Node.new.to_s).to eq "<div></div>" }
			it("starts at level 0") { expect(Node.new.level).to eq 0 }
			it("has no children") { expect(Node.new.children).to eq [] }
		end
	end

	it("has a level") { expect(Node.new(level: 10).level).to eq 10 }
	it("can level up") { expect(Node.new.level_up.level).to eq 1 }

	context "when considering children" do
		subject { parent = Node.new; parent << Node.new; parent }
		it("can add children") { expect(subject.children.size).to eq 1 }
		it("will show its children") { expect(subject.to_s).to eq "<div><div></div></div>" }
	end
end
