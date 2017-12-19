FROM commonworkflowlanguage/cwltool_module


# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
	git \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    python-setuptools
    
RUN pip install cwlref-runner

RUN mkdir -p /home/test/

WORKDIR /home/test

RUN mkdir -p /home/test/epos-cwl-workflows/

RUN git clone https://github.com/andrejsim/epos-cwl-workflows.git

WORKDIR /home/test/epos-cwl-workflows


# web based api (dissabled)
#RUN pip install Flask gunicorn
#EXPOSE 5002
#CMD FLASK_APP=flask/flask_web.py flask run --host=0.0.0.0
#RUN echo 'gunicorn -w 9 -b 0.0.0.0:5002 "flask/flask_web:bootstrap_app()" --log-level debug --backlog 0 --timeout 120 --error-logfile error.log --log-file access.log' >> docker_entry.sh 

ENTRYPOINT bash #docker_entry.sh

# docker build -t cwl_tool docker/
# docker run -it cwl_tool 

# 
# RUN  cwltool epos_accept_url_array_scatter.cwl epos_inputs.yml
# 



