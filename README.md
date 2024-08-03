# With Ansible

You should configure servers in inventory files, once done, deploy this way:
```bash
ansible-playbook -i inventory/<inventory>.ini site.yml
```

For local deployment, there is a local.ini file available
