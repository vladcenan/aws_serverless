require_relative 'spec_helper'

sfn = Aws::States::Client.new(
  region: 'us-east-1'
)

def sfn_deployed(sfn)
  return sfn.list_state_machines
end

begin
  @sfn_name.each do |s|
    if sfn_deployed(sfn)['state_machines'].any? { |vd| vd.include?(s) }
      puts s+' exists. Test PASSED!'
    else
      raise s+' was not found. Test FAILED!'
    end
  end
rescue Aws::States::Errors::ServiceError => e
  puts e
end
