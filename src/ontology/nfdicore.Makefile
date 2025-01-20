## Customize Makefile settings for nfdicore
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile



#################################################################
## import SWO terms
#################################################################

## because of https://github.com/allysonlister/swo/issues/48 we have to make a replacement "s/obofoundry/obolibrary/g"
##
## also "Declaration(AnnotationProperty(rdf:type))" had to be deleted and
## we need to remove the IAO_0000589 anotation, because it has been annotated in a way, that rdf:type would be inferred as annotation property, which is not OWL DL conform

$(IMPORTDIR)/swo_import.owl: $(MIRRORDIR)/swo.owl $(IMPORTDIR)/swo_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
	extract --method MIREOT  --upper-terms $(IMPORTDIR)/swo_terms_upper.txt  --lower-terms $(IMPORTDIR)/swo_terms.txt --copy-ontology-annotations false --force true --individuals exclude \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru \
		remove --term http://purl.obolibrary.org/obo/IAO_0000589 \
		$(ANNOTATE_CONVERT_FILE); sed -i "s/obofoundry/obolibrary/g" $(IMPORTDIR)/swo_import.owl ;  sed -i "s/Declaration(AnnotationProperty(rdf:type))//g" $(IMPORTDIR)/swo_import.owl ; fi		

######
## process import of obi
##
##   remove the http://purl.obolibrary.org/obo/OBI_0000659 specimen collection process 
######
$(IMPORTDIR)/obi_import.owl: $(MIRRORDIR)/obi.owl 
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		remove --term http://purl.obolibrary.org/obo/OBI_0000659 \
		remove --term http://purl.obolibrary.org/obo/OBI_0002076 \
		remove --term http://purl.obolibrary.org/obo/OBI_0100051 \
		remove --term http://purl.obolibrary.org/obo/OBI_0000112 \
		extract -T $(IMPORTDIR)/obi_terms.txt --copy-ontology-annotations true --force true --individuals exclude --method BOT \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

#### special handling for EDAM
$(IMPORTDIR)/edam_import.owl: $(MIRRORDIR)/edam.owl 
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/edam_terms.txt --copy-ontology-annotations true --force true --individuals exclude --method SUBSET \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi

## Module for ontology: dcat

$(IMPORTDIR)/dcat_import.owl: $(MIRRORDIR)/dcat.owl 
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/dcat_terms.txt --copy-ontology-annotations true --force true --individuals exclude --method SUBSET \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi


## Module for ontology: schema
$(IMPORTDIR)/schema_import.owl: $(MIRRORDIR)/schema.owl 
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		extract -T $(IMPORTDIR)/schema_terms.txt --copy-ontology-annotations true --force true --individuals exclude --method STAR \
	    remove --term https://schema.org/additionalType \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi


$(IMPORTDIR)/iao_import.owl: $(MIRRORDIR)/iao.owl 
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
		remove --term http://purl.obolibrary.org/obo/IAO_0020000 --preserve-structure false \
		extract -T $(IMPORTDIR)/iao_terms.txt --copy-ontology-annotations false --force true --individuals exclude --method STAR \
		remove --select "RO:*" \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru --update ../sparql/postprocess-module.ru \
		$(ANNOTATE_CONVERT_FILE); fi


#################################################################
## release base version (modification)
#################################################################

## here we need "remove --base-iri $(URIBASE)/""  instead of "remove --base-iri $(URIBASE)/NFDICORE"  as suggested in the generated main file

# base: A version of the ontology that does not include any externally imported axioms.
$(ONT)-base.owl: $(EDIT_PREPROCESSED) $(OTHER_SRC) $(IMPORT_FILES)
	$(ROBOT_RELEASE_IMPORT_MODE) \
	reason --reasoner ELK --equivalent-classes-allowed asserted-only --exclude-tautologies structural --annotate-inferred-axioms False \
	relax \
	reduce -r ELK \
	remove --base-iri $(URIBASE)/ --axioms external --preserve-structure false --trim false \
	$(SHARED_ROBOT_COMMANDS) \
	annotate --link-annotation http://purl.org/dc/elements/1.1/type http://purl.obolibrary.org/obo/IAO_8000001 \
		--ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) \
		--output $@.tmp.owl && mv $@.tmp.owl $@

#################################################################
## release simple version (modification) 
#################################################################
# somehow the standart method does not work, so we adapted the filter here
#

$(ONT)-simple.owl: $(EDIT_PREPROCESSED) $(OTHER_SRC) $(SIMPLESEED) $(IMPORT_FILES)
	$(ROBOT_RELEASE_IMPORT_MODE) \
		reason --reasoner ELK --equivalent-classes-allowed asserted-only --exclude-tautologies structural --annotate-inferred-axioms False \
		relax \
		remove --axioms equivalent \
		relax \
		filter --select "<https://nfdi.fiz-karlsruhe.de/ontology/*>" --select "annotations ontology anonymous self" \
		reduce -r ELK \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru \
		$(SHARED_ROBOT_COMMANDS) annotate --ontology-iri $(ONTBASE)/$@ $(ANNOTATE_ONTOLOGY_VERSION) --output $@.tmp.owl && mv $@.tmp.owl $@




#############################################################################
# lets add some additional annotations to the release artefacts
#############################################################################

CITATION="'Oleksandra Bruns, Tabea Tietz, Etienne Posthumus, Jörg Waitelonis, Harald Sack. NFDIcore Ontology. Revision: v$(VERSION). Retrieved from: https://nfdi.fiz-karlsruhe.de/ontology/$(VERSION)'"

ALL_ANNOTATIONS=--annotate-defined-by true \
	--ontology-iri https://nfdi.fiz-karlsruhe.de/ontology -V https://nfdi.fiz-karlsruhe.de/ontology/$(VERSION) \
	--annotation http://purl.org/dc/terms/created "$(TODAY)" \
	--annotation http://purl.org/dc/terms/bibliographicCitation "$(CITATION)"  \
	--link-annotation owl:priorVersion https://nfdi.fiz-karlsruhe.de/ontology/$(PRIOR_VERSION) \

update-ontology-annotations: 
	$(ROBOT) annotate --input ../../nfdicore.owl $(ALL_ANNOTATIONS) --output ../../nfdicore.owl && \
	$(ROBOT) annotate --input ../../nfdicore.ttl $(ALL_ANNOTATIONS) --output ../../nfdicore.ttl && \
	$(ROBOT) annotate --input ../../nfdicore-simple.owl $(ALL_ANNOTATIONS) --output ../../nfdicore-simple.owl && \
	$(ROBOT) annotate --input ../../nfdicore-simple.ttl $(ALL_ANNOTATIONS) --output ../../nfdicore-simple.ttl && \
	$(ROBOT) annotate --input ../../nfdicore-full.owl $(ALL_ANNOTATIONS) --output ../../nfdicore-full.owl && \
	$(ROBOT) annotate --input ../../nfdicore-full.ttl $(ALL_ANNOTATIONS) --output ../../nfdicore-full.ttl && \
	$(ROBOT) annotate --input ../../nfdicore-base.owl $(ALL_ANNOTATIONS) --output ../../nfdicore-base.owl && \
	$(ROBOT) annotate --input ../../nfdicore-base.ttl $(ALL_ANNOTATIONS) --output ../../nfdicore-base.ttl 




