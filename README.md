# Perforce

## Setup

## References
[Tutorial](https://www.perforce.com/manuals/p4guide/Content/P4Guide/tutorial.start-client.html)
[CLI Guide](https://www.perforce.com/manuals/p4guide/Content/P4Guide/Home-p4guide.html)

## Notes
Fundamental parts of Helix Core Server

Helix Server is an enterprise version management system in which you connect to a shared versioning server.

You sync files from a shared repository called the depot to get the latest version.

You edit files on your computer in your workspace (also known as a "client").

You manage files with the help of changelists.

You have the option of submitting to the depot any changes you make locally to make them available to other users.

The Helix Core Server, also known as Helix Server, or p4d, manages depots, which contain every revision of every file under version management. Files are organized into directory trees. The server also maintains a database of metadata that tracks the files and client activity: logs, user permissions, configuration values.

Helix Serverclients provide an interface that allows you to check files in and out of the depot, resolve conflicts, and track change requests.

Helix Server includes a number of clients: a command-line client, a graphical user interface client, and various plug-ins that work with commercial IDEs and productivity software.



## Clients
You use Helix Server clients to manage a special area of your computer, called a workspace. Directories in the depot are mapped to directories in your workspace, which contain local copies of managed files. You always work on managed files in your workspace:

    You populate your local workspace by syncing files from the depot.
    You check the files out of the depot (and into your workspace).
    You make changes to the files.
    You check them back into the depot, also known as submitting.
    If the changes you try to submit conflict with changes that other users, working in parallel with you, have already submitted, you must resolve conflicts as needed.


###
- list streams
    - p4 streams
- set client name
    - export P4CLIENT matt_tmp
- bind workspace (local work area) with the stream (repo folders)
    - p4 client -S //DAUx/dev
    - ~~p4 client -S //DAUx/dev/WebGLChat~~
- verify
    - p4 clients -S //DAUx/dev
- sync workspace to repo
    - p4 sync
- delete client
    - p4 client -d matt_tmp



