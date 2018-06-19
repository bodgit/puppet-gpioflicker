require 'spec_helper_acceptance'

describe 'gpioflicker' do

  pp = <<-EOS
    class { '::gpioflicker':
      device => '/dev/gpio0',
      pin    => 0,
    }
  EOS

  case fact('osfamily')
  when 'OpenBSD'
    it 'should work with errors' do
      # The hardware won't exist on a VM
      apply_manifest(pp, :expect_failures => true)
    end

    describe package('gpioflicker') do
      it { is_expected.to be_installed }
    end

    describe file('/etc/rc.conf.local') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'wheel' }
      it { is_expected.to be_mode 644 }
      its(:content) { is_expected.to match %r{(?mx) ^ gpioflicker_flags=-d \s /dev/gpio0 \s -p \s 0 $} }
    end
  else
    it 'should not work' do
      apply_manifest(pp, :expect_failures => true)
    end
  end
end
