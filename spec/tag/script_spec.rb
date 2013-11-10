require "spec_helper"

describe Tag::Script do
	it "accepts an intro and an outro" do
		tag = Tag::Script.new "1", "3"
		expect(tag.wrap_around "2").to eq "<?php 1 ?>2<?php 3 ?>"
	end
end
