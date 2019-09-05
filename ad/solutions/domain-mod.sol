---
- name: Creating AD groups and users
  hosts: all
  vars:
    domainname: EXAMPLE.COM
    dnsname: example.com
    domain_admin: Administrator@example.com
    user_password: RedHat123@!

  tasks:

    - name: Creating a new group in the {{ domainname }}
      win_domain_group:
        name: Test Group
        scope: domainlocal
        category: security
        attributes:
          mail: helpdesk@example.com
          wWWHomePage: www.example.com
        ignore_protection: yes

    - name: Creating a new user
      win_domain_user:
        name: daniel
        firstname: Daniel
        lastname: George
        password: "{{ user_password }}"
        state: present
        groups:
          - Domain Users
          - Test Group
        street: 125 42nd St.
        city: Sometown
        state_province: CA
        postal_code: 1234
        country: US
        attributes:
          telephoneNumber: 543-123456