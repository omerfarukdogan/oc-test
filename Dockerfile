FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7

MAINTAINER Caglar Cataloglu

# Labels consumed by Red Hat build service
LABEL com.redhat.component="jenkins-agent-maven-35-rhel7-container" \
      name="openshift3/jenkins-agent-maven-35-rhel7" \
      version="3.11" \
      architecture="x86_64" \
      io.k8s.display-name="Jenkins Agent Maven" \
      io.k8s.description="The jenkins agent maven image has the maven tools on top of the jenkins slave base image." \
      io.openshift.tags="openshift,jenkins,agent,maven"

ENV MAVEN_VERSION=3.5 \
    BASH_ENV=/usr/local/bin/scl_enable \
    ENV=/usr/local/bin/scl_enable \
    PROMPT_COMMAND=". /usr/local/bin/scl_enable"

# Install Maven

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
