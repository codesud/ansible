## ansible

This repository will have all our ansible learnings and our CM of the Project.

## What is a playbook ????
```
A Playbook is a list of plays. That's why always a playbook starts as a list ( - )
```

## What is a play ?
```
A Play is a list of tasks
```

## What is a task ?
```
Any action that you want to do is called a task
    ex: Installing a package, checking the uptime of the machine , creating a user account . . .. 
```

## What is a fact in ansible ?
```
A Fact is nothing but a property of the target node. 
Before you run any playbook, ansible collects all the facts and keeps it ready.
Ex: ansible all -i inventory -u centos -e ansible_password=DevOps321 -m setup
Note: Above command will show you the list of all the FACTS that your ansible is covering.
```

## ANSIBLE ROLES Helps you in :
```
1) Organising the code 
2) Increases the visibility of the code 
3) Duplicate code can be avoided 
4) Code can be re-used
5) Changes of intended actions like deletion / uptating /creation will have greater control
6) If the code is common, other teams can use your code.

Ref: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html
```

## ROLES Strcutre 
```
roles/
    common/               # this hierarchy represents a "role"
        tasks/            #
            main.yml      #  <-- tasks file can include smaller files if warranted
        handlers/         #
            main.yml      #  <-- handlers file
        templates/        #  <-- files for use with the template resource
            ntp.conf.j2   #  <------- templates end in .j2
        files/            #
            bar.txt       #  <-- files for use with the copy resource
            foo.sh        #  <-- script files for use with the script resource
        vars/             #
            main.yml      #  <-- variables associated with this role
        defaults/         #
            main.yml      #  <-- default lower priority variables for this role
        meta/             #
            main.yml      #  <-- role dependencies
        library/          # roles can also include custom modules
        module_utils/     # roles can also include custom module_utils
        lookup_plugins/   # or other types of plugins, like lookup in this case

    webtier/              # same kind of structure as "common" was above, done for the webtier role
    monitoring/           # ""
    fooapp/               # ""
```

## Using role dependencies
```
Role dependencies let you automatically pull in other roles when using a role.

Role dependencies are prerequisites, not true dependencies. The roles do not have a parent/child relationship. Ansible loads all listed roles, runs the roles listed under dependencies first, then runs the role that lists them. The play object is the parent of all roles, including roles called by a dependencies list.

Role dependencies are stored in the meta/main.yml file within the role directory. This file should contain a list of roles and parameters to insert before the specified role. For example:
roles/myapp/meta/main.yml
```

```
---
dependencies:
  - role: common
    vars:
      some_parameter: 3
  - role: apache
    vars:
      apache_port: 80
  - role: postgres
    vars:
      dbname: blarg
      other_parameter: 12
Ansible always executes roles listed in dependencies before the role that lists them. Ansible executes this pattern recursively when you use the roles keyword. For example, if you list role foo under roles:, role foo lists role bar under dependencies in its meta/main.yml file, and role bar lists role baz under dependencies in its meta/main.yml, Ansible executes baz, then bar, then foo
```

## This is just message added to send the chenges from feature to main

## I will show how merge happens with commands locally
```
I want to take the changes of PROD Branch and merge then to master branch
1) git checkout -b prod 
2) go all your changes on this prod branch
3) Commint the changes on this prod branch
4) Now switch to master branch
5) git merge prod  ( Prod changes will be merged to master branch )
What is a conflict ? --> If the same file is edited by two people in the checkout and if the file is merfed and the person 2 will see a confict stating that this file is modisied since your last checkout!!! Then you need to resolve the conflict, but merging the person1 changes to your repo or accept the changes.

ansible-pull -U https://github.com/b49-clouddevops/ansible.git -e COMPONENT=frontend -e ENV=dev -e TAG_NAME=0.0.2 roboshop.yml
```
