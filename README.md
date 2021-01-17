# Automatically update Godaddy DNS
## Step 1:
```
cd /usr/local/bin
sudo git clone https://mimiza@github.com/mimiza/godaddy
```
## Step 2:
```
crontab -e
```
## Step 3:
Add the following line to crontab
```
*/10 * * * *    /usr/local/bin/godaddy/update.sh mimiza db key secret > /dev/null
```
## DONE!
