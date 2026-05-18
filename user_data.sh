#!/bin/bash

set -e

dnf update -y

dnf install -y httpd jq

systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
PRIVATE_IP=$(curl -s -H "X-aws-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Instance Info</title>
</head>
<body>
    <h1>Hello from instance $INSTANCE_ID with private IP $PRIVATE_IP</h1>
</body>
</html>
EOF

