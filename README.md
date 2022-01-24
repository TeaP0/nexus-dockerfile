# Nexus-dockerfile

- server runs on port 18081

## Make commands
~~~
make nexus-build

make nexus-start

make nexus-stop
~~~

### Docker commands
~~~
docker build -t nexus ./ --force-rm --no-cache

docker run -d -p 18081:8081 -v data:/opt/nexus/sonatype-work/ --name nexus --restart always nexus
~~~
