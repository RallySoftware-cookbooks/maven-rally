require_relative 'spec_helper'

describe 'maven-rally::default' do
  let(:version) { 'foo' }
  let(:install_dir) { '/usr/local' }
  let(:tar_gz) { "apache-maven-#{version}-bin.tar.gz" }
  let(:tar_gz_path) { "#{install_dir}/#{tar_gz}" }
  subject(:chef_run) do
    stub_command("test -f #{tar_gz_path}").and_return(true)
    ChefSpec::Runner.new do |node|
      node.set[:maven][:version] = version
    end.converge described_recipe
  end

  it { should create_remote_file(tar_gz_path) }

  it { should run_execute("tar xzf #{tar_gz}").with(cwd: install_dir) }



end
