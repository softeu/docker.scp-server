FROM softeu/ubuntu-base

MAINTAINER Jindrich Vimr <jvimr@softeu.com>

RUN apt-get install -y openssh-server rssh
RUN useradd -m   data

ADD run-ssh.sh /

RUN mkdir /authorized_keys/

RUN mkdir /data && chown -R data:data /data

RUN sed -ri 's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' /etc/pam.d/sshd

EXPOSE 22

CMD ["/run-ssh.sh"]
