package main

import (
        "net/http"
	"fmt"
	"github.com/blang/semver"
)

func version(w http.ResponseWriter, r * http.Request){
  w.Header().Set("Server","SemVarServer")

  w.Header().Set("Content-Type", "application/json")

  versionString := r.FormValue("version")

  v, err := semver.Parse(versionString)
  if err != nil {
    err_msg := fmt.Sprintf("Error while parsing version param: %q", err)
    w.Write([]byte(err_msg))
  }

  incr := r.FormValue("incr")
  switch incr {
  case "patch": v.Patch++
  case "minor": v.Minor++
  case "major": v.Major++
  }

  rsp := fmt.Sprintf("{\"version\": %q}\n", v)

  w.Write([]byte(rsp))
}

func main() {
  http.HandleFunc("/", version)
    http.ListenAndServe(":8000", nil)
}
