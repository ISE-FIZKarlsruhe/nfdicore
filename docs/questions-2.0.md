
# NFDIcore Competency Questions (CQs) and SPARQL Queries

For the design and evaluation different projects contributed competecy questions the ontology should be able to answer.

## NFDI-MatWerk

All NFDI-MatWerk Use Cases are available [at the MatWerk Consortium Webpage](https://nfdi-matwerk.de/infrastructure-use-cases)

### Use Case 1

- **CQ:** What are the specific services (in digitalization) that are used in a specific academic discipline? (data science) (need to be transferred to the new generation of scientists and professionals)
<!-- 
**SPARQL:**

```sparql
SELECT ?service ?serviceType 
WHERE {
?service rdf:type ?serviceType ;
nfdicore:subjectArea ex:MaterialScience .
?serviceType rdfs:subClassOf nfdicore:Service . 
}
```-->

- **CQ:** What are the resources and events related to specific processes (demonstration and teaching)?
<!--- **SPARQL:**
```sparql
SELECT ?resource ?event ?process
WHERE
{  { ?resource bfo:RO_0000056 ?process} UNION { ?event bfo:BFO_0000050 ?process . } 

 FILTER (?process = ex:Demonstration || ?p = ex:Teaching )
}
```-->

- **CQ:** What process are organisations involved in? and what are their roles in the processes? (PP participant universities)
- **SPARQL:**
```sparql
SELECT ?organisation ?role ?process
WHERE
{ 
?organisation rdf:type nfdicore:Organization ;
bfo:RO_0000087 ?role ;
bfo:RO_0000056 ?process . 
?role bfo:BFO_0000054 ?process .
}
```

### Use Case 2

- **CQ:** What metadata schemas and ontologies are utilized in datasets that describe collections ? (materials used in Ni-based superalloys)
- **SPARQL:**
```sparql
SELECT ?dataset ?standard
WHERE
{ 
?dataset rdf:type nfdicore:Dataset ;
nfdicore:representedCollection ?collection ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?ontology .
?ontology rdf:type nfdicore:Ontology .}
```

- **CQ:** What are the standard processes material data sets involved in? (the definition, identification and curation)
- **SPARQL:**
```sparql
SELECT ?dataset ?processType
WHERE
{ 
?dataset rdf:type nfdicore:Dataset ;
nfdicore:subjectArea ex:MaterialScience  ;
bfo:RO_0000056 ?process .
?process rdf:type ?processType .
}
```

- **CQ:** How and which resources are data sets be connected to? ( detailed meta-data and context concerning materials history, data collection )
- **SPARQL:**
```sparql
SELECT ?dataset ?property ?resource
WHERE
{ 
?dataset rdf:type nfdicore:Dataset ;
?property ?resource  .
?property rdfs:subPropertyOf bfo:IAO_0000136 .
}
```

### Use Case 03

- **CQ:** What specific types of resources exist within a particular subject area, and what technological methods are employed in their storage?(Tomographic data from different techniques)
- **SPARQL:**
```sparql
SELECT ?resource ?resourceType ?technologicalMeans 
WHERE
{ 
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ex:MaterialScience ;
nfdicore:technology ?technologicalMeans .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

- **CQ:** What ontologies are used for resources in a specific subject area?
- **SPARQL:**
```sparql
SELECT ?resource ?resourceType ?standard
WHERE
{ 
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ex:MaterialScience ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?ontology .
?ontology rdf:type nfdicore:Ontology .
?resourceType rdfs:subClassOf* nfdicore:Resource .}
```

- **CQ:** What services are there for linkage and enrichment (data integration and access)? What software are they using?
- **SPARQL:**
```sparql
SELECT ?service ?software
WHERE
{ 
?service rdf:type nfdicore:Linkage\&Enrichment ;
nfdicore:software ?software .}
```

### Use Case 04

- **CQ:** What standards and specifications are used for data in a specific subject area?
- **SPARQL:**
```sparql
SELECT ?resource ?standards 
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:standard|nfdicore:specification ?standards ;
nfdicore:subjectArea ex:MaterialScience .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 05

- **CQ:** What tools and services are used for storing and evaluation of a specific data type?
- **SPARQL:**
```sparql
No SPARQL query provided
```

- **CQ:** What standards and specifications are used in a certain process? (data analysis)
- **SPARQL:**
```sparql
SELECT ?resource  
WHERE {
VALUES ?type { nfdicore:Standard nfdicore:Specification }
?resource bfo:RO_0000056 ?process ;
rdf:type ?type .
}
```

### Use Case 06

- **CQ:** What ontologies are used in a specific subject area?
- **SPARQL:**
```sparql
SELECT ?resource
WHERE {
?resource nfdicore:semanticExpressivity ?ontology ;
nfdicore:subjectArea ex:MaterialScience .
?ontology rdf:type nfdicore:Ontology .
}
```

### Use Case 08

- **CQ:** What standards are used for resources in a specific process (standardization)?
- **SPARQL:**
```sparql
SELECT ?resource  
WHERE {
?resource bfo:RO_0000056 ?process ;
rdf:type ?type nfdicore:Standard.
}
```

- **CQ:** What guidelines are there for describing specific processes? (data analysis/visualization)
- **SPARQL:**
```sparql
SELECT ?resource
WHERE {

?process rdf:type bfo:IAO_0000572 ; %documenting
bfo:BFO_0000050 ex:DataAnalysis ; %partOf
bfo:OBI_0000299 ?resource .   %has_specified_output
?resource rdf:type nfdicore:Publication .
 }
```

### Use Case 09

- **CQ:** What data portals, services and software are contributed to a specific consortia? What are the subject area of these resources?
- **SPARQL:**
```sparql
SELECT ?resource ?acDisc
WHERE {
VALUES ?type { nfdicore:Software nfdicore:DataPortal nfdicore:Service }
?resource rdf:type ?type ;
nfdicore:subjectArea ?acDisc ;
bfo:RO_0000056 ?process .
ex:NFDIMatWerk bfo:RO_0000056 ?process ;
bfo:RO_0000087 ex:Repository .
?role bfo:BFO_0000054 ?process . 
?process rdf:type nfdicore:Contributing . }
```

### Use Case 10

- **CQ:** What is the funding organisation of a specific project?
- **SPARQL:**
```sparql
SELECT ?funder 
WHERE {
?funder bfo:RO_0000056 ex:NFDI4Culture ;
bfo:RO_0000087 ex:funderRole .
?role bfo:BFO_0000054 ex:NFDI4Culture . }
```

### Use Case 12

- **CQ:** What ontologies are used in resources contributed to specific consortia? What is their subject area?
- **SPARQL:**
```sparql
SELECT ?standard ?acDisc
WHERE {
ex:NFDIMatWerk bfo:RO_0000056 ?process ;
bfo:RO_0000087 ex:Repository .
?role bfo:BFO_0000054 ?process . 
?process rdf:type nfdicore:Contributing .

?resource bfo:RO_0000056 ?process ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?ontology ;
nfdicore:subjectArea ?acDisc .
?ontology rdf:type nfdicore:Ontology . }
```

### Use Case 13

- **CQ:** What specific services (expert knowledge) are there and who is the contact point of these services?
- **SPARQL:**
```sparql
SELECT ?service ?contactPoint
WHERE {
?service rdf:type nfdicore:Learning\&Teaching ;
nfdicore:contactPoint ?contactPoint .
}
```


### Use Case 15

- **CQ:** Who is the contact point of a specific service? (ontology development)
- **SPARQL:**
```sparql
SELECT ?service ?contactPoint
WHERE {
?service rdf:type nfdicore:Linkage&Enrichment ;
nfdicore:contactPoint ?contactPoint .
}
```

### Use Case 16

- **CQ:** What ontologies are used in resources and what is their subject area?
- **SPARQL:**
```sparql
SELECT ?standard ?acDisc
WHERE {
?resource nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?ontology ;
nfdicore:subjectArea ?acDisc .
?ontology rdf:type nfdicore:Ontology . }
```

### Use Case 17

- **CQ:** What ontologies are used in resources and what is their subject area?
- **SPARQL:**
```sparql
SELECT ?standard ?acDisc
WHERE {
?resource nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?ontology ;
nfdicore:subjectArea ?acDisc .
?ontology rdf:type nfdicore:Ontology . }
```

## NFDI4DataScience
All NFDI4DataScience Use Cases (Personas) are available [at the NFDI4DataScience Consortium Webpage](https://www.nfdi4datascience.de/community/requirements-elicitation/personas/)

### Use Case Alex

- **CQ:** What data participates in a specific task (event)? (data cleaning task)
- **SPARQL:**
```sparql
SELECT ?resource ?event
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type ?resourceType .
?event rdf:type ?eventType ;
?eventType rdfs:subClassOf* nfdicore:Event .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

- **CQ:** What services participate in a specific task (event)? ( (data cleaning services)
- **SPARQL:**
```sparql
SELECT ?service ?event
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type nfdicore:Service .
?event rdf:type ?eventType ;
?eventType rdfs:subClassOf* nfdicore:Event .
}
```

### Use Case Ben

- **CQ:** What documenting resources are related to a specific event (task)? Who is a contact point of the documentation process?
- **SPARQL:**
```sparql
SELECT ?resource ?agent
WHERE {

?process rdf:type bfo:IAO_0000572 ;
bfo:BFO_0000050 ?event ; 
bfo:OBI_0000299 ?resource .
?resource rdf:type nfdicore:Publication .
?role rdf:type nfdicore:ContactPointRole ;
bfo:BFO_0000054 ?process .
?agent bfo:RO_0000056 ?process ;
bfo:RO_0000087 ?role .
 }
```

### Use Case Cassie

- **CQ:** What (training) services and events are available for specific data task (event)?
- **SPARQL:**
```sparql
SELECT distinct ?r ?type ?task
WHERE
{ {?r bfo:RO_0000056 ?task ;
rdf:type nfdicore:Learning\&Teaching ;}

UNION 
{ ?r bfo:BFO_0000050 ?task ;
rdf:type nfdicore:Event }

?r rdf:type ?type 
}
```

### Use Case David

- **CQ:** Who is a contact point of specific data (experimental)? What is their expertise?
- **SPARQL:**
```sparql
SELECT ?resource ?resourceType ?contactPoint
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:contactPoint ?contactPoint .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case Emma

- **CQ:** List the events in the community, their description and their dates.
- **SPARQL:**
```sparql
SELECT ?event ?description ?start ?end 
WHERE {
?event rdf:type nfdicore:Event ;
dc:description ?description ;
nfdicore:startDate ?start ;
nfdicore:endDate ?end .
}
```

### Use Case Finn

- **CQ:** What are the (legal) guidelines for a specific process? (store sensitive data)
- **SPARQL:**
```sparql
SELECT ?resource
WHERE {

?process rdf:type bfo:IAO_0000572 ; %documenting
bfo:BFO_0000050 ex:DataAnalysis ; %partOf
bfo:OBI_0000299 ?resource .   %has_specified_output
?resource rdf:type nfdicore:Publication .
 }
```

### Use Case Gina

- **CQ:** What are the relevant publications for a specific subject area or event (task)?
- **SPARQL:**
```sparql
SELECT ?resource ?event ?ac_disc
WHERE {
?resource rdf:type nfdicore:Publication .
{?resource nfdicore:subjectArea ?ac_disc .}
UNION
{?resource bfo:RO_0000056 ?event .
?event rdf:type ?eventType .
?eventType rdfs:subClassOf* nfdicore:Event .}
}
```

### Use Case Hassan

- **CQ:** What services are used in specific projects, which technological means and software are used in the services? If available, list guidelines/publications about these services
- **SPARQL:**
```sparql
SELECT ?service ?project ?publication ?tech
WHERE {
?service rdf:type ?serviceType ;
nfdicore:software|nfdicore:technology ?tech ;
bfo:RO_0000056 ?project .
OPTIONAL { ?publication rdf:type nfdicore:Publication ;
bfo:IAO_0000136 ?service . }
?project rdf:type nfdicore:Project .
?serviceType rdfs:subClassOf* nfdicore:Service .
}
```

## NFDI4Culture 
All NFDI4Culture Use Cases are available [at the NFDI4Culture Consortium Webpage](https://nfdi4culture.de/resources/user-stories.html)
### Use Case 1

- **CQ:** What guidelines are available for a process (storing data) in a specific academic discipline (on musical performances)?
- **SPARQL:**
```sparql
SELECT ?resource ?acDis
WHERE {
?documenting rdf:type bfo:IAO_0000572 ; 
bfo:BFO_0000050 ?process ; 
bfo:OBI_0000299 ?resource .   
?resource rdf:type nfdicore:Publication ;
nfdicore:subjectArea ?acDis .
 }
```

- **CQ:** What are the services and events related to specific processes ( structured filing and the handling of standard data)?
- **SPARQL:**

```sparql
SELECT ?resource ?event ?process
WHERE
{  { ?resource bfo:RO_0000056 ?process} UNION { ?event bfo:BFO_0000050 ?process . } 
?resource rdf:type nfdicore:Service .
}
```

### Use Case 2

- **CQ:** What standards are there for specific resource type (musical data)?
Who is a contact point of the standards?

- **SPARQL:**

```sparql
SELECT ?resourceType ?standard ?contactPoint
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:standard ?standard .
?standard nfdicore:contactPoint ?contactPoint.
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

- **CQ:** What services are available for specific data task (event)? (keep different versions accessible)
- **SPARQL:**

```sparql
SELECT ?resource ?event
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type ?resourceType .
?event rdf:type ?eventType ;
?eventType rdfs:subClassOf* nfdicore:Event .
?resourceType rdfs:subClassOf* nfdicore:Service .
}
```

### Use Case 3

- **CQ:** What best practices are used in resources in a specific academic discipline?
- **SPARQL:**

```sparql
SELECT ?bestpractice ?acDisc
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:bestPractice ?bestpractice ;
nfdicore:subjectArea ?acDisc .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

- **CQ:** What are the best practices to publish a resource using in a certain academic discipline?  
- **SPARQL:**

```sparql
SELECT ?bestPractice ?acDisc
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?resource nfdicore:subjectArea ?acDisc .
?bestPractice bfo:RO_0000056 ?process ;
rdf:type ?type .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```

- **CQ:** What (training) events are available for specific ask (adequate handling of research data)? What is their timeframe? 
- **SPARQL:**

```sparql
SELECT ?task ?event ?start ?end 
WHERE {
?event rdf:type nfdicore:Event ;
nfdicore:startDate ?start ;
nfdicore:endDate ?end ;
bfo:BFO_0000050 ?task .
}
```

### Use Case 4

- **CQ:** What information about resource is used during the publication process?
- **SPARQL:**

```sparql
SELECT ?context ?domain ?range
WHERE 
{
?publProcess rdf:type bfo:IAO_0000444 .
{?publProcess ?context ?object} UNION {?subject ?context ?publProcess}
OPTIONAL {?context rdfs:domain ?domain ;
rdfs:range ?range .}
}
```

### Use Case 5

- **CQ:** What specific services are available for  a certain task? (creating digital inventories of art collections)
- **SPARQL:**

```sparql
SELECT ?resource ?event
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type ?resourceType .
?event rdf:type ?eventType ;
?eventType rdfs:subClassOf* nfdicore:Event .
?resourceType rdfs:subClassOf* nfdicore:Service .
}
```

- **CQ:** What licenses are used in the consortia for datasets with images?
- **SPARQL:**

```sparql
SELECT ?license ?mediaType 
WHERE 
{
?resource rdf:type nfdicore:Dataset ;
nfdicore:mediaType ?mediaType ;
nfdicore:license ?license. 
}
```

- **CQ:** Who is a contact point of a specific service?
- **SPARQL:**

```sparql
SELECT ?resource ?contactPoint
WHERE 
{
?resource rdf:type ?resourceType;
nfdicore:contactPoint ?contactPoint .
?resourceType rdfs:subClassOf* nfdicore:Service .
}
```

- **CQ:** What training events are available for a certain task (publishing and maintaining image data)
- **SPARQL:**

```sparql
SELECT ?event ?task
WHERE
{?event bfo:BFO_0000050 ?task ;
rdf:type nfdicore:Event }
```

### Use Case 6

- **CQ:** What are the best practices to publish a software in a certain academic discipline (digital humanities)?
- **SPARQL:**

```sparql
SELECT ?bestPractice ?acDis
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?resource nfdicore:subjectArea ?acDis ;
rdf:type nfdicore:Software .
?bestPractice bfo:RO_0000056 ?process ;
rdf:type ?type .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```

### Use Case 7

- **CQ:** What media types are available for resources in a certain academic discipline (music ethnology) and what are their licenses? 
- **SPARQL:**

```sparql
SELECT ?academicDisc ?mediaType ?license
WHERE {
?resource nfdicore:mediaType ?mediaType ;
nfdicore:subjectArea ?academicDisc ;
nfdicore:license ?license .
}
```

- **CQ:** What teaching and learning services are available in a certain academic discipline (music ethnology)? 
- **SPARQL:**

```sparql
SELECT ?service ?acDis
WHERE {
?service rdf:type nfdicore:Learning\&Teaching ;
nfdicore:subjectArea ?acDis .
}
```

- **CQ:** What guidelines are available (for an organization) to complete a process (publishing research data) for data in a specific academic discipline (performing arts)?
- **SPARQL:**

```sparql
SELECT ?guideline ?resource ?acDis
WHERE {
?process rdf:type bfo:IAO_0000572 ; 
bfo:BFO_0000050 ?dataPublProcess ; 
bfo:OBI_0000293 ?resource ;
bfo:OBI_0000299 ?guideline .
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ?acDis .
?guideline rdf:type nfdicore:Publication .
?resourceType rdfs:subClassOf* nfdicore:Resource .
 }
```

### Use Case 8

- **CQ:** What processes (data publication, quality assurance, analyses) are certain resource types (e.g. questionnairs)  in a certain academic discipline (e.g. musicology) involved in?
- **SPARQL:**

```sparql
SELECT distinct ?process ?resourceType ?acDis
WHERE {
?process rdf:type ?processType .
?processType rdfs:subClassOf* bfo:OBI_0000011 .
{?process bfo:OBI_0000293|bfo:OBI_0000299|bfo:RO_0000057 ?resource.} UNION {?resource bfo:RO_0000056 ?process}
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ?acDis .
?resourceType rdfs:subClassOf* nfdicore:Resource .
 }
```

### Use Case 9

- **CQ:** What are the best practices for publishing research data (resources)? 
- **SPARQL:**

```sparql
SELECT ?bestPractice
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?bestPractice bfo:RO_0000056 ?process ;
rdf:type ?type .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```

### Use Case 10

- **CQ:** 
What organizations and persons are participating in processes related to creative works?
- **SPARQL:**

```sparql
SELECT ?agent ?process
WHERE
{ 
?agent rdf:type ?agentType ;
bfo:RO_0000056 ?process . 
?resource bfo:RO_0000056 ?process ;
rdf:type ?type .
?type rdfs:subClassOf* nfdicore:CreativeWork .
?agentType rdfs:subClassOf* nfdicore:Agent .
}
```

### Use Case 11

- **CQ:** What resources that belong to a certain academic discipline (e.g. Art History) are available, what controlled vocabularies are associated with them?  
- **SPARQL:**

```sparql
SELECT ?resource ?acDis ?standard
WHERE
{ 
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ?acDis ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?conVoc .
?conVoc rdf:type nfdicore:ControlledVocabulary .
?resourceType rdfs:subClassOf* nfdicore:Resource .}
```

### Use Case 12

- **CQ:** What are the services and events related to specific processes (analysis, structured filing and the handling of standard data)?
- **SPARQL:**

```sparql
SELECT distinct ?r ?type ?process
WHERE
{ {?r bfo:RO_0000056 ?process ;
rdf:type nfdicore:Learning\&Teaching ;}
UNION 
{ ?r bfo:BFO_0000050 ?process ;
rdf:type nfdicore:Event }
?r rdf:type ?type 
}
```

### Use Case 14

- **CQ:** What resources that belong to a certain academic discipline (e.g. Musicology) are available, what media types do they have and what qualities (e.g. semantic expressivity) are associated with them?  
- **SPARQL:**

```sparql
SELECT ?resource ?acDis ?mediaType ?quality 
WHERE{
?resource rdf:type ?resourcetype ;
nfdicore:subjectArea ?acDis ;
nfdicore:mediaType ?mediaType ;
?p ?quality .
?p rdfs:subPropertyOf* bfo:RO_0000086 .
?resourcetype rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 15

- **CQ:** What resources that belong to a certain academic discipline (e.g. Archaeology) are available and respresented by means of a certain semantic expressivity? 
- **SPARQL:**

```sparql
SELECT distinct ?resource ?acDis ?semExpressivityType
WHERE {
?resource rdf:type ?resourcetype ;
nfdicore:subjectArea ?acDis ;
nfdicore:semanticExpressivity ?semExpressivity .
?semExpressivity rdf:type ?semExpressivityType .
}
```

- **CQ:** What services for teaching and learning are available in a certain academic discipline?  
- **SPARQL:**

```sparql
SELECT ?service ?acDis
WHERE {
?service rdf:type nfdicore:Learning\&Teaching ;
nfdicore:subjectArea ?acDis .
}
```

### Use Case 16

- **CQ:** What services for linking and enriching as well as publishing and disseminating research data are available in a certain academic discipline (eg. Architecture)? 
- **SPARQL:**

```sparql
SELECT ?service ?acDis
WHERE {
?service rdf:type ?serviceType ;
nfdicore:subjectArea ?acDis .
VALUES ?serviceType {nfdicore:Linkage\&Enrichment nfdicore:Publication\&Dissemination}
}
```

- **CQ:** What collections are available in a certain geographical region (e.g. Germany)?
- **SPARQL:**

```sparql
SELECT ?collection ?place
WHERE {
?collection rdf:type nfdicore:Collection ;
nfdicore:location ?place .
}
```

### Use Case 17

- **CQ:** What services are available for linkage and enrichment as well as storage and preservation of research data?
- **SPARQL:**

```sparql
SELECT ?service ?serviceType
WHERE {
?service rdf:type ?serviceType ;
VALUES ?serviceType {nfdicore:Linkage\&Enrichment nfdicore:Storage\&Preservation}
}
```

### Use Case 18

- **CQ:** Who has certain areas of expertise (computer science) and is a contact of a certain service (training and learning)? 
- **SPARQL:**

```sparql
SELECT ?agent ?expertise ?service
WHERE {
        ?agent rdf:type ?agentType .
        ?agentType rdfs:subClassOf* nfdicore:Agent .
OPTIONAL {?agent nfdicore:member ?organisation .}
         ?agent nfdicore:subjectArea ?expertise .
         ?service nfdicore:contactPoint ?agent ;
         rdf:type ?serviceType .
         ?serviceType rdfs:subClassOf* nfdicore:Service .}
```

### Use Case 20

- **CQ:** What resource types are available in certain geographical locations? 
- **SPARQL:**

```sparql
SELECT ?resourceType ?location
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:location ?location .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 21

- **CQ:** What are the specifications and best practices utilized in the publishing process of a resource in a certain academic discipline (e.g. media science)?
- **SPARQL:**

```sparql
SELECT ?bestPractice ?acDisc
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?resource nfdicore:subjectArea ?acDisc .
?bestPractice bfo:RO_0000056 ?process ;
rdf:type ?type .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```

### Use Case 22

- **CQ:** What software or services are available for a certain task (event)? (versioning)
- **SPARQL:**

```sparql
SELECT ?resource ?event
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type ?type .
?event rdf:type ?eventType .
?eventType rdfs:subClassOf* nfdicore:Event .
{?type rdfs:subClassOf* nfdicore:Service} UNION {?type rdfs:subClassOf* nfdicore:Software}
}
```

### Use Case 23

- **CQ:** Which software is available in a certain academic discipline (music)? 
- **SPARQL:**

```sparql
SELECT ?academicDisc ?resource
WHERE {
?resource rdf:type ?type;
nfdicore:subjectArea ?academicDisc .
?type rdfs:subClassOf* nfdicore:Software .
}
```

- **CQ:** What learning and teaching services are available for resources of a certain discipline? 
- **SPARQL:**

```sparql
SELECT ?service ?acDis
WHERE {
?service rdf:type nfdicore:Learning\&Teaching ;
nfdicore:subjectArea ?acDis .
}
```

### Use Case 24

- **CQ:** Which resources are related to a specific subject area (ex:Architecture)?
- **SPARQL:**

```sparql
SELECT ?academicDisc ?resource
WHERE {
?resource rdf:type ?type;
nfdicore:subjectArea ?academicDisc .
?type rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 25

- **CQ:** Which resources are related to an event that occured in a specific time frame and which mediatype and, if available, semantic expressivity are they available in?
- **SPARQL:**

```sparql
SELECT distinct ?resource ?event ?mediaType ?semExpType
WHERE
{  
?resource bfo:RO_0000056 ?event ;
rdf:type ?type ;
nfdicore:mediaType ?mediaType .
?event rdf:type ?eventType .
?eventType rdfs:subClassOf* nfdicore:Event .
?type rdfs:subClassOf* nfdicore:Resource .
OPTIONAL {
?resource nfdicore:semanticExpressivity ?semExp.
?semExp rdf:type ?semExpType . }
}
```

### Use Case 26

- **CQ:** Which software was provided by an agent that participates in a project? 
- **SPARQL:**

```sparql
SELECT ?resource ?project ?agent
WHERE {
?resource rdf:type ?type ;
bfo:RO_0000056 ?process.
?process rdf:type nfdicore:Contributing ;
bfo:BFO_0000050 ?project .
?project rdf:type nfdicore:Project .
?role bfo:BFO_0000054 ?process . 
?type rdfs:subClassOf* nfdicore:Software .
?agent bfo:RO_0000056 ?process;
bfo:RO_0000087 ?role .
?role rdf:type nfdicore:ContributorRole . }
```

- **CQ:** 
Which resources and resource types were contributed by an agent that participates in a project? 
- **SPARQL:**

```sparql
SELECT ?resource ?type ?project ?agent
WHERE {
?resource rdf:type ?type ;
bfo:RO_0000056 ?process.
?process rdf:type nfdicore:Contributing ;
bfo:BFO_0000050 ?project .
?project rdf:type nfdicore:Project .
?role bfo:BFO_0000054 ?process . 
?type rdfs:subClassOf* nfdicore:Resource .
?agent bfo:RO_0000056 ?process;
bfo:RO_0000087 ?role .
?role rdf:type nfdicore:ContributorRole . }
```

- **CQ:** What persons participate in a project and belong to a certain academic discipline (computer science or digital humanities)? 
- **SPARQL:**

```sparql
SELECT ?agent ?project ?acDis
WHERE {
{?agent bfo:RO_0000056 ?process ;
bfo:BFO_0000050 ?project. } UNION
{?agent bfo:RO_0000056 ?project.}
?project rdf:type nfdicore:Project .
?agent nfdicore:subjectArea ?acDis ;
rdf:type ?agentType .
?agentType rdfs:subClassOf* nfdicore:Agent .
}
```

- **CQ:** What are lerning and training services are contributed by an agent that participates in a project? 
- **SPARQL:**

```sparql
SELECT ?resource ?project ?agent
WHERE {
?resource rdf:type nfdicore:Learning\&Teaching ;
bfo:RO_0000056 ?process.
?process rdf:type nfdicore:Contributing ;
bfo:BFO_0000050 ?project .
?project rdf:type nfdicore:Project .
?role bfo:BFO_0000054 ?process . 
?agent bfo:RO_0000056 ?process;
bfo:RO_0000087 ?role .
?role rdf:type nfdicore:ContributorRole . }
```

### Use Case 27

- **CQ:** What specifications are there for certain types of resources and mediatypes of resources?
- **SPARQL:**

```sparql
SELECT ?resourcetype ?specification ?mediatype
WHERE {
  ?resource rdf:type ?resourcetype .
  ?resourcetype rdfs:subClassOf* nfdicore:Resource .
  OPTIONAL { ?resource nfdicore:specification ?specification . }
  OPTIONAL { ?resource nfdicore:mediaType ?mediatype . }
}
```

### Use Case 28

- **CQ:** What controlled vocabularies are available for certain resource types? 
- **SPARQL:**

```sparql
SELECT ?resourceType ?standard
WHERE
{ 
?resource rdf:type ?resourceType ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?conVoc .
?conVoc rdf:type nfdicore:ControlledVocabulary .
?resourceType rdfs:subClassOf* nfdicore:Resource .}
```

## NFDI4Memory
All NFDI4Memory Use Cases are available [at the NFDI4Memory Consortium Webpage](https://4memory.de/problem-stories-overview/)

### Use Case 1

- **CQ:** Who has certain areas of expertise (e.g. IT) and is involved in a certain service (training and education)? 
- **SPARQL:**

```sparql
SELECT ?contactPoint
WHERE {
?service rdf:type nfdicore:Learning\&Teaching ;
nfdicore:contactPoint ?contactPoint .
?contactPoint rdf:type nfdicore:Person ;
nfdicore:subjectArea ex:IT .
}
```

### Use Case 3

- **CQ:** What are the best practices for a certain resource?
- **SPARQL:**

```sparql
SELECT ?bestpractice
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:bestPractice ?bestpractice .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 5

- **CQ:** What software is frequently used and who are their contact points?
- **SPARQL:**

```sparql
SELECT ?software (count(?software) as ?count) ?contactPoint
WHERE {
    ?software nfdicore:contactPoint ?contactPoint .
    ?resource nfdicore:software ?software .
}
GROUP BY ?software ?contactPoint
ORDER BY DESC(?count)
```

### Use Case 6

- **CQ:** What are the controlled vocabularies used in the consortium? 
- **SPARQL:**

```sparql
SELECT ?standard
WHERE {
ex:NFDI4Memory bfo:RO_0000056 ?process ;
bfo:RO_0000087 ex:Repository .
?role bfo:BFO_0000054 ?process . 
?process rdf:type nfdicore:Contributing .
?resource bfo:RO_0000056 ?process ;
nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?controlledVoc .
?controlledVoc rdf:type nfdicore:ControlledVocabulary . }
```

- **CQ:** What tools and services for a certain purpose are used in the consortium?
- **SPARQL:**

```sparql
SELECT ?service ?task
WHERE { 
?service rdf:type ?serviceType .
?serviceType rdfs:subClassOf* nfdicore:Service ;
rdfs:label ?task .
}
```

### Use Case 7

- **CQ:** Which licences are used in certain data resources types? 
- **SPARQL:**

```sparql
SELECT ?license (count (distinct ?license) as ?count) ?resourceType
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:license ?license .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
GROUP BY ?license ?resourceType
```

### Use Case 8

- **CQ:** What are the guidlines for a specific task? (publishing research data) 
- **SPARQL:**

```sparql
SELECT ?resource
WHERE {
?process rdf:type bfo:IAO_0000572 ; %documenting
bfo:BFO_0000050 ex:ResearchDataPublication ; %partOf
bfo:OBI_0000299 ?resource .   %has_specified_output
?resource rdf:type nfdicore:Publication .
 }
```

### Use Case 9

- **CQ:** Which organizations (archives) located in Germany contribute certain resources and what licences do they use?
- **SPARQL:**

```sparql
SELECT DISTINCT ?organization ?resource ?license 
WHERE {
?organization rdf:type nfdicore:Organization ; 
nfdicore:location ex:Germany ;
bfo:RO_0000087 ?role ;
bfo:RO_0000056 ?process .
?resource rdf:type nfdicore:Resource ;
bfo:RO_0000056 ?process ;
nfdicore:license ?license . 
}
```

- **CQ:** What guidelines for data provenance for certain data type (archival) exist?
- **SPARQL:**

```sparql
SELECT ?guideline ?resourceType
WHERE {
?process rdf:type bfo:IAO_0000572 ;
bfo:BFO_0000050 ?dataprovenance ;
bfo:OBI_0000293 ?resource ;
bfo:OBI_0000299 ?guideline .   
?guideline rdf:type nfdicore:Publication .
?resource rdf:type ?resourceType .
?resourceType rdfs:subClassOf* nfdicore:Resource .
 }
```

### Use Case 11

- **CQ:** Which organization has members with expertise in computer science or information technology? 
- **SPARQL:**

```sparql
SELECT ?organization ?member 
WHERE {
        ?organization rdf:type nfdicore:Organisation .
        ?person rdf:type nfdicore:Person ;
         nfdicore:member ?organization .
        { ?person nfdicore:subjectArea ex:ComputerScience . } 
UNION { ?person nfdicore:subjectArea ex:InformationTechnology . 
} 
}
```

### Use Case 13

- **CQ:** What data formats are used for resources in a certain academic discipline? 
- **SPARQL:**

```sparql
SELECT ?academicDisc ?mediaType
WHERE {
?resource nfdicore:mediaType ?mediaType ;
nfdicore:subjectArea ?academicDisc .
}
```

### Use Case 14

- **CQ:** What licences given for resources in a certain media type? 
- **SPARQL:**

```sparql
SELECT ?license ?mediaType
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:mediaType ?mediaType ;
nfdicore:license ?license .
?resourceType rdfs:subClassOf* nfdicore:Resource .
}
```

### Use Case 15

- **CQ:** Which services are available for a certain task? 
- **SPARQL:**

```sparql
SELECT ?service ?task
WHERE { 
?service rdf:type ?serviceType .
?serviceType rdfs:subClassOf* nfdicore:Service ;
rdfs:label ?task .
}
```

- **CQ:** Which softwares are available in a certain discipline? 
- **SPARQL:**

```sparql
SELECT ?resource ?academicDisc
WHERE {
?resource rdf:type nfdicore:Software ;
nfdicore:subjectArea ?academicDisc .
}
```

### Use Case 16

- **CQ:** Which organization offers a certain area of expertise? (IT) (including people in the organizations and their expertise)
- **SPARQL:**

```sparql
SELECT ?orga
WHERE {
?orga rdf:type nfdicore:Organization .
?person nfdicore:member ?orga .
{?orga nfdicore:subjectArea ex:IT } UNION {?person nfdicore:subjectArea ex:IT}
}
```

- **CQ:** Which organization is a contact point for a certain service?
- **SPARQL:**

```sparql
SELECT distinct ?service ?agent
WHERE {
?orga rdf:type nfdicore:Organization .
?service rdf:type ?serviceType .
?service nfdicore:contactPoint ?agent .
?serviceType rdfs:subClassOf* nfdicore:Service . 
{?agent rdf:type nfdicore:Organization} UNION {?person nfdicore:member ?agent}
}
```

### Use Case 17

- **CQ:** What services in a certain academic discipline (computer science) are there? 
- **SPARQL:**

```sparql
SELECT ?resource
WHERE {
?resource rdf:type ?resourceType ;
nfdicore:subjectArea ex:ComputerScience .
?resourceType rdfs:subClassOf* nfdicore:Service .
}
```

### Use Case 23

- **CQ:** What are the best practices to publish a resource using a certain (open) licence?  
- **SPARQL:**

```sparql
SELECT ?bestPractice ?license
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?resource nfdicore:license ?license .
?bestPractice bfo:RO_0000056 ?process ;
rdf:type ?type .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```

### Use Case 42

- **CQ:** What controlled vocabularies can be utizlized (in the publishing process) of a resource?
- **SPARQL:**

```sparql
SELECT ?standard 
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?resource nfdicore:standard ?standard .
?standard nfdicore:semanticExpressivity ?conVoc .
?conVoc rdf:type nfdicore:ControlledVocabulary .
}
```

- **SPARQL:**

```sparql
SELECT ?standard
WHERE {
?process rdf:type bfo:IAO_0000444 ;
bfo:OBI_0000299 ?resource .
?standard bfo:RO_0000056 ?process ;
rdf:type ?type ;
nfdicore:semanticExpressivity ?conVoc .
?conVoc rdf:type nfdicore:ControlledVocabulary .
VALUES ?type {nfdicore:Specification nfdicore:Standard}
}
```





