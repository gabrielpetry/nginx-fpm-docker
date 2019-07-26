# Nginx + PHP-FPM

Imagem com nginx e php-fpm, útil para desenvolvimento rápido.

# Como executar

A aplicação deve ficar em ./app/

Para inicar o container, pode ser utilizado o comando:

> docker-compose up -d


# Gitlab-ci

Esse projeto fornece o .gitlab-ci.yml para que funcione na ferramenta de CI do gitlab.

O funcionamento do script de configuração se da por realizar o build da nova imagem e enviar ao registry, e então re-iniciar a imagem no servidor de produção, dessa forma a aplicação sempre estará atualizada.

A única configuração necessário para funcionar é no arquivo .gitlab-ci.yml:
    - REGISTRY, deve conter o caminho com a porta para o seu registry
    - IMAGE\_NAME, é o nome da imagem no servidor de produção.
    - IMAGE, link da imagem para download, devem ser ajustados os usuário e o nome do projeto.
    - PORT, porta que deve ser mapeada no host.

Esse projeto foi criada como um explo para o projeto [Infra-ágil](https://github.com/gabrielpetry/king-infra), então a porta já esta na configuração do nginx, assim como o usuário padrão.
