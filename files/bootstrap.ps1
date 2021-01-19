<powershell>

#Create Kitchen Administrator User
cmd /c net user kitchen **** /add /y
cmd /c 'wmic UserAccount where Name="kitchen" set PasswordExpires=False'
cmd /c net localgroup administrators kitchen /add
 
Invoke-WebRequest -Uri https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1
Powershell -ExecutionPolicy RemoteSigned .\ConfigureRemotingForAnsible.ps1

</powershell>