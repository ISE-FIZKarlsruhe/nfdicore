
![build status](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/workflows/qc.yml/badge.svg)
![build docs](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/workflows/update-docs.yml/badge.svg)
![verification](https://github.com/ISE-FIZKarlsruhe/nfdicore/actions/workflows/verification.yml/badge.svg)

# NFDI Core Ontology

## Introduction

The [National Research Data Infrastructure (NFDI)](https://www.nfdi.de/) initiative has led to the formation of various consortia, each focused on developing a research data infrastructure tailored to its specific domain. To ensure interoperability across these consortia, the NFDIcore ontology has been developed as a mid-level ontology for representing metadata related to NFDI resources, including individuals, organizations, projects, data portals, and more.


Recognizing the diverse needs of consortia, NFDIcore is built upon the [Basic Formal Ontology (BFO)](https://basic-formal-ontology.org/), a foundational framework essential for enhancing knowledge representation, data exchange, and interdisciplinary collaboration. To address domain-specific research questions, NFDIcore serves as the basis for various application and domain ontologies, which extend its core structure in a modular fashion.
Examples include the [NFDI4Culture Ontology (CTO)](https://gitlab.rlp.net/adwmainz/nfdi4culture/knowledge-graph/culture-ontology), [NFDI MatWerk Ontology (MWO)](https://git.rwth-aachen.de/nfdi-matwerk/ta-oms/mwo),  [NFDI4Memory Ontology (MEMO)](https://nfdi.fiz-karlsruhe.de/4memory/), and [NFDI4DataScience Ontology (DSO)](https://www.nfdi4datascience.de/services/4dsontology_d/), each tailored to specific research fields while ensuring semantic interoperability.

As a mid-level ontology, NFDIcore plays a central role in structuring and integrating research data across consortia. It provides a shared vocabulary that represents both the organizational structure of the Nationale Forschungsdateninfrastruktur (NFDI) and the diverse datasets contributed by project partners. The ontology encompasses key concepts such as organizations, consortia, projects, datasets, research outputs, geographical locations, and technical standards. These structured representations enable efficient data management, integration, and reuse across disciplines.

NFDIcore focuses on describing the following main concepts:

- **Organizational & Research Structure** – Represents institutions, consortia, projects, researchers, and their roles within NFDI.  
- **Data & Information Management** – Covers datasets, data portals, collections, publications, and intellectual outputs to support research.  
- **Geographical & Contextual Information** – Includes cities, countries, and regions relevant to NFDI activities.  
- **Technology & Standards** – Encompasses software, programming languages, specifications, standards, and ontologies for interoperability.  
- **Services & Licensing** – Defines resources, service processes, licenses, and web-based platforms supporting data sharing and collaboration.  


## Versions

### Stable release versions

The latest version of the ontology can always be found at:

[nfdicore.owl](nfdicore.owl) and [nfdicore.ttl](nfdicore.ttl)

### Editors' version

Editors of this ontology should use the editing files in the [components folder](src/ontology/components).

## Documentation

* Read the docs [documentation](https://ise-fizkarlsruhe.github.io/nfdicore/docs/)
* Widoco generated [list of resources](https://ise-fizkarlsruhe.github.io/nfdicore/)

## Get in contact with the NFDIcore Team

Every Thursday at 10:00 the NFDIcore team meets and discusses the development of the ontology and its extensions in the NFDIcore Playground. Questions about specific modeling decisions can be discussed in the NFDIcore [Discussion Forum](https://github.com/ISE-FIZKarlsruhe/nfdicore/discussions). [Github issues](https://github.com/ISE-FIZKarlsruhe/nfdicore/issues) can be used to report errors or to request additional classes and properties. For general questions about NFDIcore and for participation in the Playground, please email [Tabea Tietz](mailto:tabea.tietz@fiz-karlsruhe.de).

## Conferences and Events 

The NFDIcore team can frequently be found at Semantic Web and AI conferences and Research Data Management events. Feel free to find us there and talk to us. 

### Upcoming Events

* International Conference on Formal Ontology in Information Systems (FOIS), Catania, Italy
* NFDIxCS Symposium, Potsdam, Germany
* European Congress and Exhibition on Advanced Materials and Processes (EUROMAT), Granada, Spain
* NFDI4Culture Community Plenary, Mainz, Germany
* International Semantic Web Conference (ISWC), Nara, Japan
* Ontologies4Chem - International Workshop Series, Limburg an der Lahn, Germany


## Contributing to the NFDI Ontology  

Your input helps improve the NFDI Ontology! Here’s how you can contribute:  

### 1. **Join the Discussion**  
- Check the **Discussions** tab on GitHub.  
- Share ideas, ask questions, and suggest improvements.  

### 2. **Report Issues**  
- Found an error or need a new concept?  
- Go to **Issues** > **New Issue**, describe the problem, and suggest a solution.  

### 3. **Suggest Changes**  
- Discuss your idea first in **Discussions** or **Issues**.  
- Maintainers will review and help implement improvements.  

### 4. **Stay Involved**  
- Follow updates and give feedback on new changes.  

🚀 Every contribution helps make the NFDI Ontology better!

## Acknowledgements

This ontology repository was created using the [Ontology Development Kit (ODK)](https://github.com/INCATools/ontology-development-kit).
