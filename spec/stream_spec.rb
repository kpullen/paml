require "spec_helper"

describe Stream do
	context "" do
		subject { Stream.new ["#first", "\t#second"] }

		it "has a level" do
			expect(subject.level).to eq 0
			subject.next
			expect(subject.level).to eq 1
		end

		it "returns nodes" do
			node = subject.next
			expect(node.to_s).to eq "<div id='first'></div>"
		end

		it "can be drained" do
			2.times { subject.next }
			expect(subject.next).to be_nil
		end
	end
end
