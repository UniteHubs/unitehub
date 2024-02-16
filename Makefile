dev:
	docker-compose up -d

dev-down:
	docker-compose down

start-server:
	APP_ENV=dev air

start-container-server:
	APP_ENV=prod air

build:
	docker build -t unitehub:latest .

run:
	docker run -e APP_ENV=dev --name unitehub -p 8000:6500 unitehub:latest

install-modules:
	go get github.com/go-playground/validator/v10
	go get -u github.com/gofiber/fiber/v2
	go get -u github.com/golang-jwt/jwt/v4
	go get github.com/redis/go-redis/v9
	go get github.com/google/uuid
	go get github.com/spf13/viper
	go get gorm.io/driver/postgres
	go get -u gorm.io/gorm

.PHONY: dev dev-down start-server install-modules
