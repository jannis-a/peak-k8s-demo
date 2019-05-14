package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		hostname, err := os.Hostname()
		if err != nil {
			panic(err)
		}

		_, _ = fmt.Fprintf(w, "Frontend\n\nHostname: %s\nDate: %s", hostname, time.Now().Format(time.UnixDate))
	})

	log.Println("Listening on :8000")
	log.Fatal(http.ListenAndServe(":8000", nil))
}
