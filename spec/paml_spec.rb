require "spec_helper"

describe Paml do
	context "when generating" do
		it "becomes a string" do
			stream = Stream.new "#first\n\t#second"
			expect(generate! stream).to eq "<div id='first'><div id='second'></div></div>"
		end
	end
end
