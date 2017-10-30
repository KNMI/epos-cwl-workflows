# epos-cwl-workflows
EPOS Common Workflow Language workflows

see
https://github.com/common-workflow-language/common-workflow-language

cwl-runner epos_accept_single_url_curl.cwl epos_inputs.yml

if the command requires to be run without yaml input use:

cwl-runner epos_accept_url_array_scatter.cwl --links [ 'url1',... 'urlX']

The current implementation will run in serial with cwltool.

However to demonstrate parallel data flows, arvados or toil needs to be used as the cwl orchestrator.

Dockerized
docker element included for running example.


TIP: use cwl worlflow viewer ---
https://view.commonwl.org/

