pipeline {
    agent {
       label "freebsdslave1"
    }
    stages {
        stage('Checkout') {
           steps {
            checkout([$class: 'GitSCM',
            branches: [[name: "origin/main"]],
            userRemoteConfigs: [[
            url: 'https://github.com/zhukovmisha/build_ting']]])
           }
        }
        stage('Cleaning') {
           steps {
            sh "rm -rf /usr/src"
            sh "rm -rf /usr/ports"
            sh "rm -rf /usr/plugins"
            sh "rm -rf /usr/core"
            sh "rm -rf /usr/tools"
            sh "rm -rf /usr/lang"
            sh "rm -rf /usr/local/opnsense/build"
            sh "rm -rf /tmp/*"
           }
        }
        stage('Git Clone Tools') {
           steps {
               sh "git -C /usr clone git@10.1.1.127:ting/tools.git"
           }
        }
        stage('Git Checkout Ting') {
           steps {
               sh "git -C /usr/tools checkout ting"
           }
        }
        stage('Build 1 / make checkout_branch SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools checkout_branch SETTINGS=23.1"
           }
        }
        stage('Build 2 / make dists SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools dists SETTINGS=23.1"
           }
        }
        stage('Clean Configs') {
           steps {
               sh "chmod 755 conf_cleaning.sh"
               sh "./conf_cleaning.sh"
           }
        }
        stage('Build 3.1 / make base SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools base SETTINGS=23.1"
           }
        }
        stage('Build 3.2 / make kernel SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools kernel SETTINGS=23.1"
           }
        }
        stage('Build 3.3 / make ports SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools ports SETTINGS=23.1"
           }
        }
        stage('Build 3.4 / plugins SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools plugins SETTINGS=23.1"
           }
        }
        stage('Build 3.5 / core SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools core SETTINGS=23.1"
           }
        }
        stage('Build 4 / make dvd vga serial SETTINGS=23.1') {
           steps {
               sh "make -C /usr/tools dvd vga serial SETTINGS=23.1"
           }
        }
    }
}