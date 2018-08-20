FROM centos
RUN yum install ansible -y && mkdir -p /root/.ssh && chmod 700 /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
COPY sample.yml /
COPY ansible.cfg /root/.ansible.cfg
COPY hosts /hosts
CMD ansible-playbook -i /hosts -u ec2-user sample.yml
