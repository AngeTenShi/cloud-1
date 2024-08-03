# With Ansible

You should configure servers in inventory files, once done, deploy this way:
```sh
ansible-playbook -i inventory/<inventory>.ini site.yml
```

For local deployment, there is a local.ini file available, run `ansible-playbook` command with `--ask-pass` if you haven't configured your SSH key to connect to root.
