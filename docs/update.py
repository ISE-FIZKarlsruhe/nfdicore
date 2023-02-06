import sys, httpx, os
from rdflib import Graph, RDF, OWL
from pylode import OntDoc


def main():
    g = Graph()
    g.parse(sys.argv[1])
    version = ""
    onto_uri = ""
    for s, p, o in g.triples((None, None, None)):
        if p == OWL.versionInfo:
            version = str(o)
        if o == OWL.Ontology:
            onto_uri = str(s)
    _, end = os.path.split(onto_uri)

    od = OntDoc(sys.argv[1])
    html = od.make_html()
    token = os.environ.get("SCHPIEL_TOKEN")
    pathname = f"{end}_{version}"
    docs_uri = os.environ.get("DOCS_URI")

    r = httpx.post(
        docs_uri,
        json={"token": token, "pathname": pathname, "content": html},
    )
    print(r.text)
    if r.status_code != 200:
        sys.exit(1)


if __name__ == "__main__":
    main()
