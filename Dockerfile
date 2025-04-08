# Use the official Spark image with Hadoop
FROM bitnami/spark:3.5.0

# Install Python and pip
USER root
RUN apt-get update && apt-get install -y python3 python3-pip && \
    pip3 install jupyter findspark pandas

# Create a working directory
RUN mkdir /opt/workspace
WORKDIR /opt/workspace

# Set environment variables
ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=jupyter
ENV PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip='0.0.0.0' --port=8888 --no-browser --allow-root"

# Expose Jupyter port
EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]