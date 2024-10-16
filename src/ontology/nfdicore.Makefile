## Customize Makefile settings for nfdicore
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile

#########
## import SWO terms
#########

## because of https://github.com/allysonlister/swo/issues/48 we have to make a replacement "s/obofoundry/obolibrary/g"
##
## also "Declaration(AnnotationProperty(rdf:type))" had to be deleted and
## we need to remove the IAO_0000589 anotation, because it has been annotated in a way, that rdf:type would be inferred as annotation property, which is wrong (that's and error in SWO)

$(IMPORTDIR)/swo_import.owl: $(MIRRORDIR)/swo.owl $(IMPORTDIR)/swo_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
	extract --method MIREOT  --upper-terms $(IMPORTDIR)/swo_terms_upper.txt  --lower-terms $(IMPORTDIR)/swo_terms.txt --copy-ontology-annotations false --force true --individuals exclude \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru \
		remove --term http://purl.obolibrary.org/obo/IAO_0000589 \
		$(ANNOTATE_CONVERT_FILE); sed -i "s/obofoundry/obolibrary/g" $(IMPORTDIR)/swo_import.owl ;  sed -i "s/Declaration(AnnotationProperty(rdf:type))//g" $(IMPORTDIR)/swo_import.owl ; fi		



#########
## release base version 
#########

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


# foo-simple: (edit->reason,relax,reduce,drop imports, drop every axiom which contains an entity outside the "namespaces of interest")
# drop every axiom: filter --term-file keep_terms.txt --trim true
#	remove --select imports --trim false
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





