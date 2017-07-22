def arduinos=[
              ["uno", "atmega328p"],
              ["mega", "atmega2560"],
             ]

def node_factory(board, mcu) {
            node {
                stage("Checkout") {
			checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: false, recursiveSubmodules: true, reference: '', trackingSubmodules: false]], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '37739cd2-9654-4774-9380-79e73137d547', url: 'git@github.com:jed-frey/ArduinoMultiShield.git']]])
                }
                stage('Setup Environment') {
                    sh([script: "make -j2 env"])
                }
                stage("Build ${project}") {
                    withEnv(["BOARD_TAG=${board}", "BOARD_SUB=${mcu}"]) {
                        sh([script: "make projects"])
                    }
                }
                stage("Archive Artifacts") {
                    archiveArtifacts([artifacts: '*/build-*/*.elf, */build-*/*.hex'])
                    fingerprint '*/build-*/*.elf, */build-*/*.hex'
                }
                stage("Delete Builds") {
                    sh([script: "rm -rf */build-*"])
                }
            }
}

def builds = [:]

for (int i = 0; i < arduinos.size(); i++) {
    // Get the actual string here.
    def board = arduinos.get(i)[0]
    def mcu = arduinos.get(i)[1]
    // Into each branch we put the pipeline code we want to execute
    builds["${board}_${mcu}"] = {
        node_factory("${board}", "${mcu}")
    }
}

parallel builds
