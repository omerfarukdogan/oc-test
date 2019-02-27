FROM registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7

MAINTAINER Caglar Cataloglu

# Labels consumed by Red Hat build service
LABEL com.redhat.component="jenkins-agent-maven-35-rhel7-container" \
      name="openshift3/jenkins-agent-maven-35-rhel7" \
      version="3.11" \
      architecture="x86_64" \
      io.k8s.display-name="Jenkins Agent Caglar" \
      io.k8s.description="The jenkins agent maven image has the maven tools on top of the jenkins slave base image." \
      io.openshift.tags="openshift,jenkins,agent,maven,caglar"

ENV PATH="/data1/uxbuild/apache-maven-3.0.5/bin:${PATH}"

# Install Maven

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
