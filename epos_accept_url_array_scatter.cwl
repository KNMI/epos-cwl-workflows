#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow

# author KNMI
# https://github.com/andrejsim/epos-cwl-workflows
# cwl descriptions
label: "EPOS-IT Array Curl WF"
doc: "Downloads data based on an array of strings representing rest urls and a curl download workflow."

# patern description in
# http://www.commonwl.org/v1.0/UserGuide.html#Writing_Workflows

# cwl requirements necessary for workflows and scatter to work.
# used to allow software diversity within the workflow.
requirements:
  - class: SubworkflowFeatureRequirement
  - class: ScatterFeatureRequirement

# array of urls passed to workflow as cwl inputs
inputs:
  links:
    type:
      type: array
      items: string

# files downloaded in parallel expected as cwl outputs
outputs:
  download:
    type: 
      type: array
      items: File
    outputSource: "#process/download"


# workflow steps defined, each step is a parallelizable process when orchestrated under relevant conditions
steps:

  # workflow parallelized with scatter.
  # step id 'process'
  process:

    # inputs added from links array in inventory. defined by epos_inputs.yml
    in:
      message: links

    # each array item is specified as an individual step input  
    scatter: message

    # output of step 
    out: [download]

    # scattered steps, pattern described here
    # https://doc.arvados.org/user/cwl/cwl-style.html

    # workflow / command line defined with run.
    run:
      # single download url workflow is defined in the file bellow
      # the workflow can be run independently
          
      epos_accept_single_url_curl.cwl    




 
