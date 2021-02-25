 #!/bin/bash
 sudo yum update -y
 sudo yum install -y httpd.x86_64
 sudo systemctl enable --now httpd
 echo "<h1>My amazing web server</h1>" | sudo tee /var/www/html/index.html
