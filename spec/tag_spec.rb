require "spec_helper"

describe Paml::Tag do
	it "turns a hash of attributes into HTML attributes" do
		tag = Tag.new "div", {a: 1, b: 2}
		expect(tag.wrap_around "").to eq "<div a='1' b='2'></div>"
	end

	it "wraps content" do
		tag = Tag.new "div"
		expect(tag.wrap_around "asdf").to eq "<div>asdf</div>"
	end
end
