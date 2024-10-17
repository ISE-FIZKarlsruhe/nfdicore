# Ontology

Aligning with [IAO](https://github.com/information-artifact-ontology/IAO) and [SCHEMA](https://schema.org/), NFDIcore focuses on describing 3 main concepts:

1. Digital Information Artifacts (nfdicore:Resource), e.g. data sets, data portals, publications, services, software, etc. 

2. Independent Continuants that act autonomously (nfdicore:Agent), e.g. organizations and persons

3. Planned processes and events, e.g. nfdicore:Project, nfdicore:Contributing, nfdicore:Event.



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