installDockerFunction() {
    echo we will install docker in this function
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
    sudo /usr/local/bin/minikube start --extra-config=apiserver.service-node-port-range=80-30000 --force --driver=docker

    set tempFolder=$PWD

    cd ~
    echo stop install
}

installMicrok8sFunction() {
    if ! [ -x "$(command -v microk8s)" ]; then
        sudo snap install microk8s --classic
        microk8s status --wait-read
    else
        echo "microk8s is already installed"
    fi

    cd $HOME
    mkdir .kube
    cd .kube
    microk8s config > config
}

echo "Please enter k8s type"
read k8s

if [ $k8s = minikube ]
        then installMinikubeFunction;
        else installMicrok8sFunction
fi