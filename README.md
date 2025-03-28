# docker_go_sample

This repository is for learing porposes.<br/>
It's a minimal out of the box docker sample.<br/>

Files:<br/>
Dockerfile: describes docker instructions<br/>
package.json: contains dependencies needed to run the serverside application<br/>
app.js: serverside application (simple express server)<br/>


Create a image named "docker_go_sample" from the Dockerfile:<br/>
	docker build -t docker_go_sample . <br/>

Description:<br/>
docker build = default command to build a image<br/>
-t = tag = name for the image<br/>
. = take everything in the build directory (current filepath)<br/>


Run a docker-container based on the previously built image:<br/>
	docker run -p 3000:3000 -d docker_go_sample <br/>

Description:<br/>
docker run = default command to run a container<br/>
-p = port = binds port 3000 of the container (left side) to the port 3000 of the host (right side)<br/>
-d = detached mode = does not block console interaction (background task)<br/>


Visit the application:<br/>
	http://localhost:3000 <br/>