cd ~
mkdir consul-ui
cd consul-ui
sudo wget https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip
sudo unzip consul_0.6.4_web_ui.zip
sudo rm consul_0.6.4_web_ui.zip
sudo yum -y install httpd
mkdir /home/ec2-user/services
cd /home/ec2-user/services
sudo cat > web.json <<- "EOF"
{
    "service":  {
        "name": "apache web server",
        "port": 80,
        "tags": ["apache", "demonstration"],
        "check": {
            "script": "curl localhost:80 > /dev/null 2>&1",
            "interval": "10s"
        }
    }
}
EOF
sudo service httpd restart
