# Container image that runs your code
FROM nginx

# Copy index to Nginx web root
COPY index.html /usr/share/nginx/html/
