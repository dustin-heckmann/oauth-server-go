package main

import (
	"fmt"
	"net/http"
)

func main() {
	port := 8080
	fmt.Printf("Starting OAuth server on port %d\n", port)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "OAuth Server Running")
	})

	err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		fmt.Println("Error starting server:", err)
	}
	fmt.Println("Server running on port", port)
}
