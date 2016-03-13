#!/bin/bash

### MAC_NOTES_FOLDER
MAC_NOTES_FOLDER="${HOME}/Workspace/mac-os-x-notes"
if [ ! -r "${MAC_NOTES_FOLDER}" ]; then
    echo "Error reading ${MAC_NOTES_FOLDER}" 1>&2
    exit 1
fi

### .bashrc
chmod +x "${MAC_NOTES_FOLDER}/bashrc.sh"
"${MAC_NOTES_FOLDER}/bashrc.sh"

### JAVA_HOME
if [[ ! $(grep -E 'JAVA_HOME' "${HOME}/.bashrc") ]]; then
    echo '# JAVA_HOME is needed by apps like mvn' >> ~/.bashrc
    echo 'export JAVA_HOME="$(/usr/libexec/java_home)"' >> ~/.bashrc
    echo 'export PATH="${PATH}:${JAVA_HOME}/bin"' >> ~/.bashrc
fi

### maven
if [[ ! $(grep -E 'MAVEN_HOME' "${HOME}/.bashrc") ]]; then
    cd "${HOME}/Packages"
    curl -O http://apache.cs.utah.edu/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
    cd
    cp "${HOME}/Packages/apache-maven-3.3.9-bin.tar.gz" "${HOME}/Applications/"
    cd "${HOME}/Applications"
    tar xvzf apache-maven-3.3.9-bin.tar.gz
    rm apache-maven-3.3.9-bin.tar.gz
    cd
    echo '# maven' >> ~/.bashrc
    echo 'export MAVEN_OPTS="-Xms256m -Xmx2048m -XX:MaxPermSize=512m"' >> ~/.bashrc
    echo 'export MAVEN_HOME="${APPS_HOME}/apache-maven-3.3.9"' >> ~/.bashrc
    echo 'export M2_HOME="${MAVEN_HOME}"' >> ~/.bashrc
    echo 'export PATH="${PATH}:${MAVEN_HOME}/bin"' >> ~/.bashrc
fi

### gradle
if [[ ! $() ]]; then
    cd "${HOME}/Packages"
    curl -O https://downloads.gradle.org/distributions/gradle-2.11-bin.zip
    cd
    cp "${HOME}/Packages/gradle-2.11-bin.zip" "${HOME}/Applications/"
    cd "${HOME}/Applications"
    unzip gradle-2.11-bin.zip
    rm gradle-2.11-bin.zip
    cd
    echo '# gradle' >> ~/.bashrc
    echo 'export GRADLE_HOME="${APPS_HOME}/gradle-2.11"' >> ~/.bashrc
    echo 'export PATH="${PATH}:${GRADLE_HOME}/bin"' >> ~/.bashrc
fi
