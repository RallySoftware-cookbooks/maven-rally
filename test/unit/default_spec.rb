require_relative 'spec_helper'

describe 'maven-rally::default' do

  def init_chef_run
    chef_run = ChefSpec::ChefRunner.new
    chef_run.node.set[:maven][:version] = '3.0.5'
    chef_run.node.set[:maven][:path] = '/usr/local'
    chef_run.node.set[:maven][:owner] = 'root'
    chef_run.node.set[:maven][:group] = 'root'
    chef_run.node.set[:maven][:mode] = '755'
    chef_run.converge 'maven-rally::default'
    chef_run
  end

  it 'uses remote_file to download the maven targz' do
    chef_run = init_chef_run
    expect(chef_run).to create_remote_file '/usr/local/apache-maven-3.0.5-bin.tar.gz'
  end

  it 'will execute tar command if file exists' do
    chef_run = init_chef_run
    expect(chef_run).to execute_command('tar xzf apache-maven-3.0.5-bin.tar.gz')
  end

end
