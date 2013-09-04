require 'spec_helper'

describe Node do
	let(:node) { FactoryGirl.create(:node) }

	before { @node = node }
	subject{ @node }

	it { should respond_to(:name)}
	it { should respond_to(:summary)}
	it { should respond_to(:sort)}
	it { should respond_to(:topics_count)}

end
