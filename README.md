# vufind-all


## Para rodar o container

```bash
docker build -t lucasrodri/vufind-all:1.3 .
docker run -d -p 8080:80 --name vufind-all lucasrodri/vufind-all:1.3
```

## Para atualizar o container

```bash
docker login
docker build -t lucasrodri/vufind-all:1.3 .
docker tag lucasrodri/vufind-all:1.3 lucasrodri/vufind-all:1.4
docker push lucasrodri/vufind-all:1.4
```

## Autores

- Lucas Rodrigues Costa - [lucasrodri](mailto:lucasrc.rodri@gmail.com)