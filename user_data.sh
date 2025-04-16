#!/bin/bash
# Update and install Apache
sudo yum update -y
sudo yum install -y httpd

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a directory for website content
mkdir -p /var/www/html

# Create an index.html with image tag pointing to S3
cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Hello from Jasleen, Mykel, Anju, Aftab</h1>
    <p>Hostname/IP: $(hostname)</p>
    <img src="https://aftab-is-pheonix.s3.us-east-1.amazonaws.com/ilovecats.jpg" alt="Image from S3" style="width:500px;height:auto;">
  </body>
</html>
EOF
