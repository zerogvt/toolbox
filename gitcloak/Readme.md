# git-cloak
A very simple docker image that when run masks your regular local git username and password with the ones you built it with.

# Preconditions
You need to set up locally a new ssh key and add it to your github account ([follow this guide](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)). The user, email account you will use for this key must match the ones you will use on the Build step.

# Build
`docker build -t git-cloak` --build-arg USER usernameyouwant --build-arg EMAIL emailyouwant`

# Run
- cd into the dir of your project
- run docker image `docker run -it --rm -v `pwd`:`pwd` -v '/absolute/path/to/your/home/.ssh':'/root/.ssh' -w `pwd` gitcloak bash`
- once inside the container perform your usual git operations (`git add .; git commit -m; etc`)
- the user and email will have been cloaked by the user and email you built the image with
```
localhost$ run -it --rm -v `pwd`:`pwd` -v '/Users/zerogvt/.ssh':'/root/.ssh' -w `pwd` gitcloak bash
root@ctnr$ git config --list
user.name=usernameyouwant
user.email=emailyouwant
```
