require "spec_helper"
require "paml/line"

describe Paml::Line do
	context "when considering default values" do
		subject { Line.new }
		it("starts at level 0") { expect(subject.level).to eq 0 }
		it("is a div") { expect(subject.tag).to eq "div" }
		it("has plain content") { expect(subject.content_type).to eq :plain }
		it("has no content") { expect(subject.content).to be_empty }
	end
end
