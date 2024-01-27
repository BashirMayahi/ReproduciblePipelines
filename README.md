---
editor_options: 
  markdown: 
    wrap: 72
---

# ReproduciblePipelines

### **Instructions for Setting Up and Running the Pipeline Using Docker**

Prerequisites Before begin, should make sure meet the following
requirements.

**Docker installation**: At first step, must have Docker installed on
your system. You can download and install Docker from Docker's official
website. After installation, you should verify the installation by
running docker --version on your command line or terminal.

**Installing Git**: You should make sure you have Git installed on your
system for the cloning repository. If it is not installed, you can
download it from Git's official site. Verify the installation by running
git --version on your command line or terminal.

# Setup and Execution Steps

-    **Clone the GitHub Repository**

    Clone the repository containing the Dockerfile and pipeline code:

    -   git clone \<your_git_hub_repo_address_here\>

        Replace \<your_git_hub_repo_address_here\> with the URL of
        GitHub repository.

-   **Navigate to the Repository Directory**

    Change your current directory to the cloned repository:

    -   cd \<repository_name\>

        Replace \<repository_name\> with the name of the folder created
        by the git clone command.

-   **Build the Docker Image**

    Navigate to the directory containing the Dockerfile: cd
    <repository_name> Build the Docker image using the following
    command. This will create a Docker image named inferinsur: docker
    build -t inferinsur .

-   **Run the Docker Container with Volume Mounting**

    Run the Docker container while mounting a volume. This step allows
    the container to access a specific folder on your host machine,
    enabling data sharing between the host and the container: docker run
    --rm --name my_container -v
    /path/to/shared_folder:/home/inferinsur/shared_folder/:rw inferinsur
    Replace /path/to/shared_folder with the path to the folder on your
    host machine that you want to share with the Docker container.

-   **Output**

    After the Docker container has finished processing, check the
    contents of the shared_folder on your host machine for the output:
    ls /path/to/shared_folder This command lists the files in the shared
    folder, where you should find the output of the pipeline.
