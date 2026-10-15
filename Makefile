postgres:
		docker run --name golang-course -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:16-alpine

createdb:
		docker exec -it golang-course createdb --username=root --owner=root simplebank

dropdb:
		docker exec -it golang-course dropdb simplebank

migrateup:
		migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
		migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down

psql:
		docker exec -it golang-course psql -U root -d simplebank

test:
	go test -v -cover ./...

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb psql migrateup migratedown sqlc test