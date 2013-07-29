require_relative 'spec_helper'

describe file('/usr/local/apache-maven-3.0.5-bin.tar.gz') do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

describe file('/usr/local/apache-maven-3.0.5') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe file('/usr/local/maven') do
  it { should be_linked_to '/usr/local/apache-maven-3.0.5'}
end
