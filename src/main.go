package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	// Create a new Echo instance
	e := echo.New()

	// Define a route for the root URL
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	// Start the server on port 3000
	e.Logger.Fatal(e.Start(":3000"))
}