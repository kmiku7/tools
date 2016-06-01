package main

import (
	"net/http"
	"fmt"
	"encoding/json"
)

func EchoHandler(resp http.ResponseWriter, req *http.Request) {
	
	req.ParseForm()
	
	fmt.Printf("Method:%s\n", req.Method)
	fmt.Printf("Url:%s\n", req.URL.String())
	headerStr, err := json.Marshal(req.Header)
	if err != nil {
		fmt.Printf("Marshal Header Failed:%v\n", err)
	}
	fmt.Printf("Headers:%s\n", string(headerStr))
	formStr, err := json.Marshal(req.Form)
	if err != nil {
		fmt.Printf("Marshal Form Failed:%v\n", err)
	}
	fmt.Printf("Forms:%s\n", string(formStr))
}

func main() {

	http.HandleFunc("/echo_post", EchoHandler)

	http.ListenAndServe(":10086", nil)

}
