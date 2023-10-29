# docker-elektrophon
Docker build image for elektrophon

## download the docker image from dockerhub

```
docker pull ghcr.io/spielhuus/docker-elektrophon:main
```

## generate the pages

```
docker run -v {PATH TO CONTENT}:/github/workspace \
           -ti --rm ghcr.io/spielhuus/docker-elektrophon:main \
           build
```

## serve the blog locally

```
docker run -v {PATH TO CONTENT}:/github/workspace \
           -p 1313:1313 -ti --rm \
           ghcr.io/spielhuus/docker-elektrophon:main \
           serve
```

## clean the local repository

```
docker run -v {PATH TO CONTENT}:/github/workspace \
           -ti --rm ghcr.io/spielhuus/docker-elektrophon:main \
           clean
```

## run jupyterlab

```
docker run -v {PATH TO CONTENT}:/github/workspace \
           -p 8888:8888 -ti --rm \
           ghcr.io/spielhuus/docker-elektrophon:main \
           notebook
```

## run kicad inside the container

```
docker run -v {PATH TO CONTENT}:/github/workspace \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --network host \
           -e DISPLAY=$DISPLAY \
           -e COOKIE="`xauth list`" \
           -ti ghcr.io/spielhuus/docker-elektrophon:main \
           kicad
```

## Credits:

* https://docker.io
* https://gohugo.io/
* https://jupyter.org/

## License

[Boost Software License](http://www.boost.org/LICENSE_1_0.txt) - Version 1.0 - August 17th, 2003
