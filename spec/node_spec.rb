require "spec_helper"

describe Paml::Node do
	context "when constructing nodes" do
		context "when accepting pre-element whitespace" do
			it "accepts tabs" do
				expect(Paml::Node.from_line(Line.new whitespace: "\t").level).to eq 1
			end
			it "doesn't accept spaces" do
				expect(Node.from_line(Line.new whitespace: " ").level).to eq 0
			end
		end
	end

	context "when using defaults" do
		subject { Node.new }
		it("is a div") { expect(subject.to_s).to eq "<div></div>" }
		it("starts at level 0") { expect(subject.level).to eq 0 }
		it("has no children") { expect(subject.children).to eq [] }
	end

	context "when considering levels" do
		it "has a level" do
			line = Line.new whitespace: "\t" * 10
			expect(Node.new(line).level).to eq 10
		end

		it "can level up" do
			basic = Node.new
			basic.level_up
			expect(basic.level).to eq 1
		end
	end

	context "when considering children" do
		subject do
			parent = Node.new
			parent << Node.new
			parent
		end
		it "can add children" do
			expect(subject.children.size).to eq 1
		end
	end
end
