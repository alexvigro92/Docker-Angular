### STAGE 1: Build ###
FROM node:12.7-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

### STAGE 2: Run ###
FROM nginx:1.17.1-alpine AS prod-stage
COPY --from=build /app/dist/dockerAngular /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]




# docker build -t dockerangular .
# -t is to tag the image
# docker run -d -it -p 8000:80 --name angulardocker dockerangular###
# -d doit in the background 
# -it iterative and will stay running in the console


# alpine is a distribution of linux very light, this makes the distro
# a great image base for utilites.

# ngix is a reverse proxy server fot http, https, and other protocols
# it has a strong focus on hight concurrency, hight performance and 
# low memory usage, thats why it is used to serve in containers.