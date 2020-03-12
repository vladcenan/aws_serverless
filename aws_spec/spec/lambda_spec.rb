require_relative 'spec_helper'

def lambda_test (name, handler, memory_size, timeout)
  describe lambda(name) do
    it { should exist }
    it { should have_env_vars() }
    its(:runtime) { should eq 'python3.7' }
    its(:handler) { should eq handler }
    its(:memory_size) { should eq memory_size }
    its(:timeout) { should eq timeout }
    its(:version) { should eq "$LATEST" }
  end
end

lambda_test('dev-lambda-secrets01', 'lambda-secrets.lambda_handler', 1024, 300)
lambda_test('dev-lambda-set01', 'lambda-set.lambda_handler', 1024, 300)
lambda_test('dev-lambda-get01', 'lambda-get.lambda_handler', 1024, 300)
