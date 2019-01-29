package main

import (
	"database/sql"
	"log"
	"os"

	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/ryo-h/sqlboiler-example/src/app/models"
	"github.com/volatiletech/sqlboiler/boil"

	_ "github.com/lib/pq"
)

func connect() (*sql.DB, error) {
	db, err := sql.Open("postgres", "dbname=localdb user=postgres password=mysecretpassword1234 host=db sslmode=disable")
	boil.SetDB(db)
	return db, err
}

func main() {
	db, err := connect()
	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	} else {
		r := gin.Default()
		r.GET("/users", func(c *gin.Context) {
			users, err := models.Users().All(c, db)
			if err != nil {
				log.Fatal(err)
				c.String(http.StatusInternalServerError, "server error")
			} else {
				c.JSON(http.StatusOK, users)
			}
		})
		r.POST("/users", func(c *gin.Context) {
			var user models.User
			c.BindJSON(&user)

			var update = models.User{Name: user.Name}
			err := update.Upsert(c, boil.GetContextDB(), false, nil, boil.Whitelist("name"), boil.Infer())
			if err != nil {
				log.Fatal(err)
				c.String(http.StatusInternalServerError, "server error")
			} else {
				c.JSON(http.StatusOK, user)
			}
		})
		r.Run()
	}
}
