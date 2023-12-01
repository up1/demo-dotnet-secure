FROM openjdk:8-jdk
ARG JMETER_VERSION="5.6.2"

# Download and install JMeter
RUN wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
    tar -xvzf apache-jmeter-${JMETER_VERSION}.tgz && \
    rm apache-jmeter-${JMETER_VERSION}.tgz

# Set JMeter home
ENV JMETER_HOME /apache-jmeter-${JMETER_VERSION}/

# Add JMeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH

# Entrypoint has been set to the JMeter directory
WORKDIR ${JMETER_HOME}
COPY ./lib ./lib
# Default command will run jmeter in GUI mode
ENTRYPOINT ["jmeter"]