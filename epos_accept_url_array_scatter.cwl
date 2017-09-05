#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

# author KNMI
label: "EPOS-IT Array Curl WF"
doc: "Downloads data based on an array of strings representing rest urls and a curl download workflow."

requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement

# array of urls passed to workflow
inputs:
  links:
    type:
      type: array
      items: string

# files downloaded in parallel expected as output
outputs:
  download:
    type: 
      type: array
      items: File
    outputSource: 
      process/downloadfile


steps:

# workflow parallelized with scatter.
  process:
    in:
      inpurls: links

    scatter: inpurls

    out: [downloadfiles]

    run:
    
# single download
      class: Workflow
      
      inputs: 
        inpurls: string

      outputs:
        downloadfile:
          type: File
          outputSource: 
            step1/response

      steps:
        step0:
          run:
            epos_accept_single_url_curl.cwl  
        
          in: 
            url: inpurls
            name: step0/uuid

          out: [] #[response]

 
