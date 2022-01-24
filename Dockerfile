# Use a base image of ubi8/ubi:8.3 and set an arbitrary maintainer
FROM redhat/ubi8:8.3-297 as ubi

MAINTAINER dev

RUN useradd -ms /bin/bash nexus
#Install the java-1.8.0-openjdk-devel package.
RUN yum -y install \
  java-1.8.0-openjdk-devel \
  wget

FROM ubi as nexus
# Define NEXUS_HOME environment variable to /opt/nexus
ENV NEXUS_HOME /opt/nexus

# Define default working directory to NEXUS_HOME
WORKDIR $NEXUS_HOME 
RUN chown -R nexus:nexus $NEXUS_HOME && chmod 755 $NEXUS_HOME
USER nexus
# Unpack downloaded Nexus bundle into NEXUS_HOME folder
RUN wget -qO- https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz | tar xvzf - -C ./

# Define a volume mount point for the /opt/nexus/sonatype-work container directory
VOLUME /opt/nexus/sonatype-work/

# Define the command for starting Nexus server
ENTRYPOINT ["./nexus-3.37.3-02/bin/nexus", "run"]
# Define exposed ports
EXPOSE 8081
