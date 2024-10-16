## Customize Makefile settings for nfdicore
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


## import SWO terms

## because of https://github.com/allysonlister/swo/issues/48 we have to make a replacement "s/obofoundry/obolibrary/g"
## also "Declaration(AnnotationProperty(rdf:type))" had to be deleted
## we also need to remove the IAO_0000589 anotation, because it has been annotated in a way, that rdf:type would be inferred as annotation property


$(IMPORTDIR)/swo_import.owl: $(MIRRORDIR)/swo.owl $(IMPORTDIR)/swo_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
	extract --method MIREOT  --upper-terms $(IMPORTDIR)/swo_terms_upper.txt  --lower-terms $(IMPORTDIR)/swo_terms.txt --copy-ontology-annotations false --force true --individuals exclude \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru \
		remove --term http://purl.obolibrary.org/obo/IAO_0000589 \
		$(ANNOTATE_CONVERT_FILE); sed -i "s/obofoundry/obolibrary/g" $(IMPORTDIR)/swo_import.owl ;  sed -i "s/Declaration(AnnotationProperty(rdf:type))//g" $(IMPORTDIR)/swo_import.owl ; fi		


