require_relative 'spec_helper'

describe cloudwatch_event(@cloud_watch[0]) do
  it { should exist }
  it { should be_enable }
  its(:name) { should eq 'dev-cw-event' }
  its(:state) { should eq 'ENABLED' }
end
