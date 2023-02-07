# Ontology Documentation Updates

When the nfdicore.ttl file is updated, a Github Workflow action is triggered to generate updated LODE documentation.
The script [update.py](update.py) is executed, which generates a new LODE HTML representation of the ontology,
and then does an update using a HTTP call for the version number of this ontology to the storage of the documentation.

The current storage of the documentation is a [SHMARQL](https://github.com/epoz/shmarql) instance, running on
[https://nfdi.fiz-karlsruhe.de/](https://nfdi.fiz-karlsruhe.de/)
For example, here is [ontology_v1.1.0-alpha](https://nfdi.fiz-karlsruhe.de/ontology_v1.1.0-alpha), which was generated with [this Github action](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/runs/4102893274)

## Potential Improvements

- [ ] Also update the content-negotation version of the ontology when the .ttl is updated

- [ ] Do updates not only on the specific filename nfdicore.ttl, but any .ttl file in the repo. Needs discussion.

If there are other issues/suggestions, please add them to the issues list in the repo, and flag them with label `documentation`
