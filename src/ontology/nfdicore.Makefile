## Customize Makefile settings for nfdicore
## 
## If you need to customize your Makefile, make
## changes here rather than in the main Makefile


## import SWO terms

## because of https://github.com/allysonlister/swo/issues/48 we have to make a replacement "s/obofoundry/obolibrary/g"


$(IMPORTDIR)/swo_import.owl: $(MIRRORDIR)/swo.owl $(IMPORTDIR)/swo_terms.txt
	if [ $(IMP) = true ]; then $(ROBOT) query -i $< --update ../sparql/preprocess-module.ru \
	extract --method MIREOT  --upper-term http://www.w3.org/2002/07/owl#topObjectProperty --lower-terms $(IMPORTDIR)/swo_terms.txt --copy-ontology-annotations true --force true --individuals exclude \
		query --update ../sparql/inject-subset-declaration.ru --update ../sparql/inject-synonymtype-declaration.ru \
		$(ANNOTATE_CONVERT_FILE); sed -i "s/obofoundry/obolibrary/g" $(IMPORTDIR)/swo_import.owl ; fi		


