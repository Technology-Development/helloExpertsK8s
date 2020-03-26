package main
import ("fmt"
		"log"
		"net/http"
)	
func main() {
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":8888", nil))
}

func handler(w http.ResponseWriter, r *http.Request){
	fmt.Fprintln(w, "hello RubyI am running on localhost")
}
