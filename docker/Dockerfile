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

RUN mkdir -p /home/test/

WORKDIR /home/test

RUN git clone https://github.com/andrejsim/epos-cwl-workflows.git

WORKDIR /home/test/epos-cwl-workflows

RUN pip install Flask

EXPOSE 5000

CMD FLASK_APP=flask_web.py flask run --host=0.0.0.0

#ENTRYPOINT ["bash"]

# docker build -t cwl_tool docker/
# docker run -it cwl_tool 

# 
# RUN  cwltool epos_accept_url_array_scatter.cwl epos_inputs.yml
# 

