package main

import (
	"bytes"
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"golang.org/x/net/html"
)

const version = "0.0.0"

var (
	showHelp    bool
	showVersion bool
)

// Element holds basic HTML element info to simplify moving into JSON
type Element struct {
	Type       string
	Data       string
	Attributes []map[string]interface{}
}

func html2doc(fname string) (*html.Node, error) {
	src, err := ioutil.ReadFile(fname)
	if err != nil {
		return nil, fmt.Errorf("%s, %s", fname, err)
	}
	doc, err := html.Parse(bytes.NewReader(src))
	if err != nil {
		log.Fatalf("%s, %s", fname, err)
	}
	return doc, nil
}

func doc2json(fname string, doc *html.Node) ([]byte, error) {
	var tree []*Element
	//FIXME: need to do a depth first walk through this parse tree
	// and decide how I want to represent that in JSON.
	src, err := json.Marshal(tree)
	if err != nil {
		return nil, fmt.Errorf("json marshal, %s, %s", fname, err)
	}
	return src, fmt.Errorf("doc2json(%q, doc) not implemented", fname)
}

func html2json(fname string) ([]byte, error) {
	doc, err := html2doc(fname)
	if err != nil {
		log.Fatalf("%s, %s", fname, err)
	}
	return doc2json(fname, doc)
}

func display(src []byte, err error) {
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%s\n", src)
}

func init() {
	flag.BoolVar(&showHelp, "h", false, "display this help message")
	flag.BoolVar(&showVersion, "v", false, "display version.")
}

func main() {
	flag.Parse()
	if showHelp == true {
		fmt.Println("USAGE: html2json [OPTIONS] HTML_FILENAME")
		flag.PrintDefaults()
		fmt.Printf("version %s\n", version)
		os.Exit(0)
	}

	if showVersion == true {
		fmt.Printf("version %s\n", version)
		os.Exit(0)
	}

	for _, fname := range flag.Args() {
		display(html2json(fname))
	}
}
