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

ARG PATH_MAVEN="/data1/uxbuild/apache-maven-3.0.5/bin"
ARG PATH_JAVA="/data1/uxbuild/jdk/jdk1.8.0_152/bin"
ARG PATH_GRADLE="/data1/uxbuild/gradle-2.6/bin"
ARG PATH_ANDROID_TOOL="/data1/uxbuild/android-sdk-linux/tools"
ARG PATH_ANDROID_P_TOOL="/data1/uxbuild/android-sdk-linux/platform-tools"
ARG PATH_FORTIFY="/data1/uxbuild/fortify/bin"
ARG PATH_PEC="/data1/uxbuild/ca/pec"
ARG PATH_SCM="/data1/uxbuild/ca/scm/bin"
ARG PATH_DEF_JAVA="/usr/lib/jvm/jre-1.8.0/bin/java"
ARG PATH_JDK_JAVA="/data1/uxbuild/jdk/jdk1.8.0_152"

ENV var=${var}

ENV PATH="${PATH_JDK_JAVA}:${PATH_MAVEN}:${PATH_JAVA}:${PATH_GRADLE}:${PATH_ANDROID_TOOL}:${PATH_ANDROID_P_TOOL}:${PATH_FORTIFY}:${PATH_PEC}:${PATH_SCM}:${PATH}"

# Install Maven

RUN chown -R 1001:0 $HOME && \
    chmod -R g+rw $HOME

USER 1001
