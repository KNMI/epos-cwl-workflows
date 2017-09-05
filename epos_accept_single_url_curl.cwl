#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

# author KNMI EPOS Team
label: "epos single download"
doc: "EPOS-IT Curl Workflow: downloads data based on curl input."

# use epos_imputs.yml for demo

inputs:
  message: string

outputs:
  []

steps:
  step0:
    run:
      class: CommandLineTool

      baseCommand: [ 'uuidgen' ]

      inputs: []

      outputs:
        uuid: 
          type: stdout 

    in: []
    out: [uuid] # file

  step1:
    run:
      class: CommandLineTool

      baseCommand: [ 'curl' ]

      inputs:
        url: 
          type: string
          inputBinding:
            position: 1

        fileout: 
          type: File
          inputBinding:
            prefix: '-o'
            position: 2

      #stdout: ${inputs.fileout}

      outputs:
        download:
          type: File        
          outputBinding:  
            glob: ${inputs.fileout}

    in:
      url: message
      fileout: step0/uuid

    out: 
      [download]