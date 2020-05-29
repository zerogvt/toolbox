# git-cloak
A very simple docker image that when run masks your regular local git username and password with the ones you built it with.

# Build
`docker build -t git-cloak` --build-arg USER usernameyouwant --build-arg EMAIL emailyouwant`

# Run
- cd into the dir of your project
- run docker image `docker run -it --rm -v `pwd`:`pwd` -v '/absolute/path/to/your/home/.ssh':'/root/.ssh' -w `pwd` gitcloak bash`
- once inside the container perform your usual git operations (`git add .; git commit -m; etc`)
- the user and email will have been cloaked by the user and email you built the image with
```
ctnr$ git config --list
user.name=usernameyouwant
user.email=emailyouwant
```

