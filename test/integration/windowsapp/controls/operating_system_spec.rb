
control 'operating_system' do
    
      describe user('Administrator') do
        it { should exist }
      end

      describe chocolatey_package('git') do
        it { should be_installed }
      end

end