# yumrepo
Scripts to create a yum repo from Kernel.org

Place the rebuild-repo.sh and sync-repo.sh in /usr/local/bin

Add sync-repo.sh to cron to run daily

Install apache with the html home pointing to /var/ftp/pub/yum/CentOS

Point your yum clients to your new server