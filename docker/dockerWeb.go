package main
import ("fmt"
		"log"
		"net/http"
		"os"
)	
func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}

func handler(w http.ResponseWriter, r *http.Request){
	hostname := os.Getenv("HOSTNAME")
	fmt.Fprintln(w, "hello Ruby I am running on", hostname)
}
