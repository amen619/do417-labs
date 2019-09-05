---
- name: Creating an additional AD controller
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    dnsname: example.com
    domain_admin: Administrator@example.com
    safe_password: RedHat123@!

  tasks:

    - name:  Promoting the server to an AD controller
      win_domain_controller:
        dns_domain_name: "{{ dnsname }}"
        domain_admin_user: "{{ domain_admin }}"
        domain_admin_password: "{{ password }}"
        safe_mode_password: "{{ safe_password }}"
        state: domain_controller
     