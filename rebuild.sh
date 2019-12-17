docker rm ft_server
docker rmi ft_server
docker build -t ft_server .
docker run --name ft_server -p 80:80 -it ft_server
