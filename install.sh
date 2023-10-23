#!/bin/sh
installDockerFunction() {
    if ! [ -x "$(command -v minikube)" ]; then
        sudo apt-get install -y \
            apt-transport-https \
            ca-certificates \
            curl \
            software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88
        sudo add-apt-repository \
            "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
            $(lsb_release -cs) \
            stable"
        sudo apt-get update
        sudo apt-get install -y docker-ce
        # Linux post-install
        sudo groupadd docker
        sudo usermod -aG docker $USER
        sudo systemctl enable docker
    else 
        echo "docker is already installed"
    fi
}

installHelmFunction() { 
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
}

installMinikubeFunction() {
    echo start install
    if ! [ -x "$(command -v minikube)" ]; then
        echo "Installing minikube..."
        curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.28.2/minikube-linux-amd64
        chmod +x minikube
        sudo cp minikube /usr/local/bin/

        echo "Configuring minikube..."
        minikube config set ShowBootstrapperDeprecationNotification false
        minikube config set WantUpdateNotification false
        minikube config set WantReportErrorPrompt false
        minikube config set WantKubectlDownloadMsg false

    else
        echo "minikube is already installed"
    fi
    
    rm -rf /tmp/juju-mk*
    sudo /usr/local/bin/minikube start --extra-config=apiserver.service-node-port-range=80-30000 --force --driver=docker

    cd ~
    echo stop install
}

installMicrok8sFunction() {
    if ! [ -x "$(command -v microk8s)" ]; then
        sudo snap install microk8s --classic
        #microk8s status --wait-read
    else
        echo "microk8s is already installed"
    fi

    #cd $HOME
    #mkdir .kube
    #cd .kube
    #microk8s config > config
}

installKubectlFunction() {
    echo "install kubectl"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin
    kubectl version --client
}

#echo "Which use k8s cluster, minikube or microk8s"
#read k8s

#if [ $k8s = minikube ]
#        then installMinikubeFunction;
#        else installMicrok8sFunction
#fi
installDockerFunction;
#installMinikubeFunction;
installMicrok8sFunction;
installKubectlFunction;
installHelmFunction;
