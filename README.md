![build docs](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/workflows/update-docs.yml/badge.svg)
![verification](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/workflows/verification.yml/badge.svg)

# NFDI Core Ontology

This is version v2.0.0 of the NFDIcore ontology.

The [National Research Data Infrastructure (NFDI) initiative](https://www.nfdi.de/) has seen the establishment of various consortia, each dedicated to developing a research data infrastructure tailored to its respective domain. To facilitate interoperability across these consortia, the NFDIcore ontology (prefix nfdicore) has been developed and serves as a mid level ontology for representing metadata about NFDI resources such as individuals, organizations, projects, data portals, etc.  

Recognizing the diverse needs of consortia, NFDIcore establishes mappings to a wide array of standards across domains, including the [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/) and [schema.org](https://schema.org/), which is crucial for advancing knowledge representation, data exchange, and collaboration across diverse domains. To answer domain-specific research questions, NFDIcore is extended following a modular approach, as e.g. with the culture ontology module [CTO](https://gitlab.rlp.net/adwmainz/nfdi4culture/knowledge-graph/culture-ontology), matwerk ontology module [MWO](https://git.rwth-aachen.de/nfdi-matwerk/ta-oms/mwo), etc.

Aligning with [IAO](https://github.com/information-artifact-ontology/IAO) and [SCHEMA](https://schema.org/), NFDIcore focuses on describing 3 main concepts:
1. Digital Information Artifacts (nfdicore:Resource), e.g. data sets, data portals, publications, services, software, etc. 
2. Independent Continuants that act autonomously (nfdicore:Agent), e.g. organizations and persons
3. Planned processes and events, e.g. nfdicore:Project, nfdicore:Contributing, nfdicore:Event.

A documentation of nfdicore.ttl (version 2.0.0) can be found at the namespace [https://nfdi.fiz-karlsruhe.de/ontology](https://nfdi.fiz-karlsruhe.de/ontology).

