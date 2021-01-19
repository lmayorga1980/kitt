### Terraform AWS Windows and Ansible



### Environment Variables for Ansible

```
export ANSIBLE_STDOUT_CALLBANK="debug"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

KITCHEN_PWD=****
```

### Run the Example

* `bundle exec kitchen converge`
* `bundle exec kitchen verify`