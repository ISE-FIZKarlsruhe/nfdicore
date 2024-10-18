# Ontology

The NFDI Ontology is a mid-level ontology designed to represent both the organizational structure of the Nationale Forschungsdateninfrastruktur (NFDI) and the diverse datasets provided by NFDI project partners.

## Overview

The Ontology provides a shared vocabulary and a consistent framework that supports data management, integration, and interoperability across a wide range of disciplines. Below is an overview of key concepts within the ontology:

### Key Concepts

#### Organizational 
- **Organization**: Represents institutions, research groups, or companies involved in NFDI activities.
- **Person**: An individual, such as a researcher or contributor, participating in NFDI projects.
- **Consortium**: Represents collaborative groups formed by multiple organizations within the NFDI.
- **ConsortiumMember**: A participant within a consortium, whether an organization or person.
- **ConsortiumMemberRole**: Defines the roles played by members within a consortium, such as "lead partner" or "contributor"
- **Project**: Represents individual research projects or initiatives within the NFDI ecosystem.

#### Research and Academic
- **AcademicDiscipline**: Categories representing different fields of study or research disciplines.
- **Publication**: Scholarly works or research reports published as a result of NFDI projects.
- **Contributing**: Represents contributions made by people or organizations to a project or dataset.
- **Event**: Represents events such as conferences, workshops, or meetings organized by NFDI or related entities.

#### Geographical
- **City**: Represents cities related to projects, events, or organizational locations.
- **Country**: Countries where NFDI organizations or research activities are based.
- **FederalState**: States or provinces within a country, relevant to the localization of activities or organizations.
- **Place**: A more general class representing any location such as cities, countries, or regions.

#### Data and Information
- **Dataset**: Structured collections of data produced or managed by NFDI partners.
- **DataPortal**: Digital platforms or repositories where datasets are stored and accessed.
- **Collection**: Represents grouped resources, such as datasets, publications, or software.
- **CreativeWork**: Any intellectual output, including publications, datasets, software, or media.


#### Vocabulary and Metadata
- **ControlledVocabulary**: Standardized lists of terms used to maintain consistency in data descriptions.
- **Glossary**: A collection of terms with definitions, helping to clarify terminology across NFDI datasets.
- **Thesaurus**: Structured lists of related terms, including hierarchical and associative relationships.
- **Taxonomy**: Organized classification systems for categorizing data or entities.

#### Technology and Standards
- **Software**: Represents software tools or applications developed and used within the NFDI.
- **ProgrammingLanguage**: Programming languages used in developing software or tools.
- **Specification**: Defines technical specifications related to datasets, software, or services.
- **Standard**: Represents standards followed for data management, storage, and dissemination.
- **TechnologicalMeans**: Technologies or tools employed within the NFDI system to facilitate data management.
- **Ontology**: Formalized structures of knowledge representation, including the NFDI Ontology itself.
- **SemanticExpressivity**: Represents the extent to which a dataset or ontology supports rich, detailed data descriptions.


#### Resource and Service
- **Resource**: General class for any entity utilized within the NFDI framework, such as datasets or software.
- **Service**: Represents services provided within NFDI, including data storage, management, and preservation.
- **License**: Represents the legal terms under which datasets, publications, or software are made available.
- **Website**: Represents websites or web services associated with NFDI partners or projects.
- **MIME-Type**: Standardized file formats used in datasets, defining how files should be interpreted.
- **MediaType**: Represents the type of media used in datasets, such as images, text, or audio.



## Resources

Within NFDIcore, resources encompass a wide range of digital creative works, including datasets, collections, and metadata, as well as offered products and services such as data portals, data curation, and data digitization. These resources are categorized as information content entities (IAO_0000030), derived from material entities (BFO_0000040). 

Each information content entity may establish \"is about\" (IAO_0000136) object relations, linking it to other material entities or information content entities that define its subject matter. In NFDIcore, the \"is about\" property is expanded to offer more detailed semantics and a comprehensive overview of the relationships between resources and material entities.
 
![image](https://raw.githubusercontent.com/ISE-FIZKarlsruhe/nfdicore/v2.0.0/figures/resources1.png)


Apart from relations to information content entities and material entities, resources within NFDIcore can also be described using specific qualities (BFO_0000019). For instance, resources can be associated with academic disciplines (nfdicore:AcademicDiscipline) they belong to or a degree of semantic expressivity the resources hold, allowing for a more nuanced understanding of their context and relevance. For this, property \"has quality\" (RO_0000086) is extended with more granular nfdicore properties.
 
![image](https://raw.githubusercontent.com/ISE-FIZKarlsruhe/nfdicore/v2.0.0/figures/resources2.png)


Resources within NFDIcore engage in diverse relationships with agents, facilitated by various properties such as nfdicore:contributor, nfdicore:publisher, and nfdicore:contactPoint. While these properties enable direct connections between agents and resources, they may lack some expressivity. In scenarios requiring more detailed semantics to describe the relationship between an agent and a resource, the modeling proposed by BFO can be employed. To maintain consistency, we establish nfdicore properties like nfdicore:publisher as shortcuts using SWRL rules.
 
![image](https://raw.githubusercontent.com/ISE-FIZKarlsruhe/nfdicore/v2.0.0/figures/resources3.png)


## Agents

Likewise, in NFDIcore, the concept of Agents extends to both organizations and persons, serving as independent continuants within BFO ontology. Agents are essential for management of research data resources, and include entities such as research institutions, consortia, universities, companies, and individual researchers or data scientists. 

Within NFDIcore, agents can be directly linked to resources via different relations; may participate in different processes (BFO_0000015) and be associated with diverse roles (BFO_0000023), e.g. nfdicore:PublisherRole, nfdicore:ContributorRole, etc. within the processes. Moreover, agents engage in diverse relationships with other agents, e.g. nfdicore:member, nfdicore:partnerOrganization, etc. For consistency's sake, we streamline NFDIcore properties like nfdicore:contactPoint and nfdicore:fundingOrganization by creating shortcuts through SWRL rules.
 
![image](https://raw.githubusercontent.com/ISE-FIZKarlsruhe/nfdicore/v2.0.0/figures/agents.png)


## Processes and Events

In general, a process (BFO_0000015) can encompass subordinate processes and may involve instances marked by defined start and end times. Within NFDIcore, a planned process (OBI_0000011) commonly serves to establish connections between agents and information content entxities (IAO_0000030), defining the roles (BFO_0000023) of agents with respect to the involved information content entities.

The nfdicore:Event is associated with temporal entities that transpire over time, commonly marked by specific incidents or occurrences. The nfdicore:Event, classified as an occurrent (BFO_0000003), serves as a representation for various happenings such as conferences, workshops, or activities like \"the 37th German Congress for Art History\" or \"Workshop \"Introduction to Iconclass\"\". Events are characterized by their start and end times and can be connected to agents involved in the events.

![image](https://raw.githubusercontent.com/ISE-FIZKarlsruhe/nfdicore/v2.0.0/figures/events.png)