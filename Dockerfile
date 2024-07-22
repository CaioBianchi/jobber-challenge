# Use the official Ruby image from the Docker Hub
FROM ruby:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed gems
RUN gem install minitest

# Run the tests when the container launches
CMD ["ruby", "jobber.rb"]
