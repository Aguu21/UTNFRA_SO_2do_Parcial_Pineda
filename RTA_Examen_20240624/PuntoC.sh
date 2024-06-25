vim index.html
vim Dockerfile
sudo lvextend -l +100%FREE /dev/mapper/vg_datos-lv_docker
docker build -t web1-pineda .
docker login -u aguu21
docker tag web1-pineda aguu21/web1-pineda:latest
docker push aguu21/web1-pineda:latest
vim run.sh
chmod +x run.sh
