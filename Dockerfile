FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y python3 tzdata openssh-server && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
RUN mkdir -p /var/run/sshd && \
    echo "root:docker"|chpasswd
RUN sed -i 's/#PermitRootLogin \(prohibit-password\|no\)/PermitRootLogin yes/' /etc/ssh/sshd_config 
CMD service ssh start && tail -f /dev/null
