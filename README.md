# docker-elektrophon
Docker build image for elektrophon

## download the docker image from dockerhub

```
docker pull ghcr.io/spielhuus/docker-elektrophon:main
```

## generate the pages

```
docker run -v $(pwd):/github/workspace \
           -ti --rm ghcr.io/spielhuus/elektron-docker:nightly \
           build
```

## serve the blog locally

```
docker run -v $(pwd):/github/workspace \
           -p 1313:1313 -ti --rm \
           ghcr.io/spielhuus/elektron-docker:nightly \
           serve
```

## clean the local repository

```
docker run -v $(pwd):/github/workspace \
           -ti --rm ghcr.io/spielhuus/elektron-docker:nightly \
           clean
```

## run kicad inside the container

```
docker run -v $(pwd):/github/workspace \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           --network host \
           -e DISPLAY=$DISPLAY \
           -e COOKIE="`xauth list`" \
           -ti ghcr.io/spielhuus/elektron-docker:nightly \
           kicad
```

## Credits:

* https://docker.io
* https://gohugo.io/

## License

[Boost Software License](http://www.boost.org/LICENSE_1_0.txt) - Version 1.0 - August 17th, 2003
