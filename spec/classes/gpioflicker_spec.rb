require 'spec_helper'

describe 'gpioflicker' do

  let(:params) do
    {
      device: '/dev/gpio0',
      pin:    9,
    }
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('gpioflicker') }
      it { is_expected.to contain_class('gpioflicker::config') }
      it { is_expected.to contain_class('gpioflicker::install') }
      it { is_expected.to contain_class('gpioflicker::params') }
      it { is_expected.to contain_class('gpioflicker::service') }
      it { is_expected.to contain_package('gpioflicker') }
      it { is_expected.to contain_service('gpioflicker').with_flags('-d /dev/gpio0 -p 9') }
    end
  end
end
