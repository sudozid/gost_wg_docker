# gost_wg_docker

Docker container for exposing WireGuard Client as a SOCKS5 Proxy using Gost (GO Simple Tunnel). 

Steps to get running:

1. Clone the git repo
2. Build the docker image
   `sudo docker build -t gost_wg_docker .`
3. Modify the env variables in docker-compose.yml to suit your needs
4. Run using
   `docker compose up -d`

Credits:
1. https://github.com/ginuerzh/gost
2. ChatGPT made half the thing
