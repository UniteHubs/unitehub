# Build stage
FROM golang:latest as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go install github.com/cosmtrek/air@latest

CMD ["make", "start-container-server"]

EXPOSE 8000

# Run stage
FROM golang:latest

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go install github.com/cosmtrek/air@latest

CMD ["make", "start-container-server"]

EXPOSE 8000



# # Set the command to run the application
#
# # Build stage 
# # Use the official Golang image as the base image
# FROM golang:alpine3.19 AS builder

# # Set the working directory
# WORKDIR /app


# # Copy the rest of the application code
# COPY . .
# RUN go build -o main ./cmd/unitehub/main.go 

# # Run stage
# FROM golang:alpine3.19 
# WORKDIR /app
# COPY --from=builder /app/main .
# COPY .env.dev .

# # Expose the port the app runs on
# EXPOSE 8080

# # Set the command to run the application
# CMD ["/app/main", "-env=value"]