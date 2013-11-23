require_relative 'spec_helper'

describe 'maven-rally::default' do
  let(:version) { 'foo' }
  let(:base_dir) { '/foo/bar' }
  let(:maven_file_name) { "apache-maven-#{version}" }
  let(:install_path) { "#{base_dir}/#{maven_file_name}" }
  let(:archive) { "#{maven_file_name}-bin.tar.gz" }
  let(:archive_path) { "#{base_dir}/#{archive}" }

  subject(:chef_run) do
    stub_command("test -f #{archive_path}").and_return(true)
    ChefSpec::Runner.new do |node|
      node.set[:maven][:version] = version
      node.set[:maven][:path] = base_dir
    end.converge described_recipe
  end

  it { should create_remote_file(archive_path) }

  it { should run_execute("tar xzf #{archive}").with(cwd: base_dir) }
  
  it { should create_link("#{base_dir}/maven") }
  specify { chef_run.link("#{base_dir}/maven").should link_to(install_path) }

  it { should create_link('/usr/local/bin/mvn') }
  specify { chef_run.link('/usr/local/bin/mvn').should link_to("#{base_dir}/maven/bin/mvn") }

end