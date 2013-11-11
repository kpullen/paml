require "spec_helper"

describe Paml::Line do
	context "when considering default values" do
		subject { Line.new }
		it("starts at level 0") { expect(subject.level).to eq 0 }
		it("is a div") { expect(subject.tag).to eq "div" }
		it("has plain content") { expect(subject.content_type).to eq :plain }
		it("has no content") { expect(subject.content).to be_empty }
	end

	context "when considering attributes" do
		subject { Line.new attributes: "a: 1", id: "my_id", class: "my_class" }
		it "converts all attribute keys to symbols" do
			expect(subject.attributes.keys.select {|k| k.is_a? Symbol}.size).to eq subject.attributes.keys.size
		end

		it "parses attributes" do
			expect(subject.attributes[:a]).to eq "1"
		end

		it "unifies the id" do
			expect(subject.attributes[:id]).to eq "my_id"
		end

		it "unifies the class" do
			expect(subject.attributes[:class]).to eq "my_class"
		end
	end
end
