# Deploy Gitlab In Ubuntu VM

![alt text](gitlab.webp)


# Install all services needed 
apt update 

sudo apt-get install -y policycoreutils-python-utils

sudo apt install openssh-server


# Install service Postfix and enable it 
 sudo apt install postfix

 service postfix start

 sudo systemctl enable postfix


 service postfix status

# Install gitlab-ce

cd /tmp

curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

sudo bash /tmp/script.deb.sh

sudo apt install gitlab-ce



# Install  firewalld and enable http and https

sudo apt install firewalld

sudo firewall-cmd --permanent --zone=public --add-service=http

sudo firewall-cmd --permanent --zone=public --add-service=https

sudo firewall-cmd status

sudo firewall-cmd reload

Install all services needed 


# Editing the GitLab Configuration File 

sudo nano /etc/gitlab/gitlab.rb

Search for the external_url configuration line. Update it to match your domain and make sure to change http to https to automatically redirect users to the site protected by the Let’s Encrypt certificate:

external_url 'https://your_domain'



find letsencrypt configuration ,uncomment it and change it :

letsencrypt['enable'] = true

letsencrypt['contact_emails'] = ['example@example.com']


finally find the smtp configuration and update it to successfuly send new authentification email when new signup:


in this example i use smtp gmail: 



gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "example@example.com"
gitlab_rails['smtp_password'] = "your password"
gitlab_rails['smtp_domain'] = "gmail.com"
gitlab_rails['smtp_authentication'] = "login"
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false

### Email Settings

gitlab_rails['gitlab_email_enabled'] = true

##! If your SMTP server does not like the default 'From: gitlab@gitlab.example.com'
##! can change the 'From' with this setting.
gitlab_rails['gitlab_email_from'] = 'example@example.com'
gitlab_rails['gitlab_email_display_name'] = 'Ghassen'
gitlab_rails['gitlab_email_reply_to'] = 'example@example.com'
gitlab_rails['gitlab_email_subject_suffix'] = ''














finally we need to reconfigure gitlab-ctl

sudo gitlab-ctl reconfigure





### In case we need to install gitlab runner to use gitlab ci/cd self hosted use this instructions :

curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

sudo apt-get install gitlab-runner

 sudo gitlab-runner -version

sudo gitlab-runner status


then you need to register for this new runner:

sudo gitlab-runner register






