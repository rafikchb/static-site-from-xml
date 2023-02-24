<?xml version="1.0"  encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0"  encoding="iso-8859-1" indent="yes" doctype-system="Recettes.dtd"/>
    <!-- // add the <!DOCTYPE Recettes SYSTEM "Recettes.dtd"> in the output -->
    <xsl:template match="/" >
        <Recettes>

            <!-- _______________________ begin apply Recette template  _______________________ -->

            <xsl:for-each select="//objet[@type = 'recette']">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
            <!-- _______________________ end apply Recette template  _______________________ -->

            <!-- _______________________  begin apply Ingredients template _______________________ -->
            <Ingredients>
                <xsl:for-each select="//objet[@type = 'ingrédient']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </Ingredients>
            <!-- _______________________ end apply Ingredients template  _______________________ -->

            <!-- _______________________ begin apply Auteurs template  _______________________ -->
            <Auteurs>
                <xsl:for-each select='//objet[@type = "auteur"]'>
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </Auteurs>
            <!-- _______________________ end apply Auteurs template  _______________________ -->

            <!-- _______________________  begin apply Categorie template_______________________ -->
            <Categorie_plats>
                <xsl:for-each select='//objet[@type = "catégorie"]'>
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </Categorie_plats>
            <!-- _______________________ end apply Categorie template  _______________________ -->

            <!-- _______________________ begin apply Produit template_______________________ -->
            <Produits>
                <xsl:for-each select="//objet[./@type = 'produit']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </Produits>
            <!-- _______________________ end apply Produit template  _______________________ -->

        </Recettes>
    </xsl:template>


    <!-- _______________________ begin of defining the recette template  _______________________  -->
    <xsl:template match="//objet[@type = 'recette']">
        <Recette>
            <xsl:attribute name="recette_id">
                <xsl:value-of select="@id"/><!--pour selectioner l'id-->
            </xsl:attribute>
            <Titre>
                <xsl:value-of select="info[@nom='nom']/@value"/><!--pour selectioner le nom-->
            </Titre>
            <Resume>
                <xsl:value-of select="info[@nom='résumé']/p/t/text()"/><!--pour selectioner le nom-->
            </Resume>
            <Photo>
                <Url>
                    <xsl:value-of select="info[@nom='photo']/@value"/><!--pour selectioner le nom-->
                </Url>
                <Description>
                    image
                </Description>
            </Photo>
            <Date_publication>
                <xsl:value-of select="info[@nom='date_publication']/@value"/><!--pour selectioner le nom-->
            </Date_publication>

            <Dificulte>
                <xsl:value-of select="info[@nom='difficulté']/@value"/><!--pour selectioner le nom-->
            </Dificulte>
            <Recette_ingredients>
                <xsl:for-each select="info[@nom='ingrédient']">
                    <Recette_ingredient >
                        <xsl:attribute name="Recette_ingredient_id">
                            <xsl:value-of select="@value"/>
                        </xsl:attribute>
                    </Recette_ingredient>
                </xsl:for-each>
            </Recette_ingredients>
            <Nombre_perssone>
                <xsl:value-of select="info[@nom='nbre_personnes']/@value"/><!--pour selectioner le nom-->
            </Nombre_perssone>
            <Temp_preparation>
                <xsl:value-of select="info[@nom='Préparation' and @value]/@value"/>
            </Temp_preparation>
            <Temp_cuisson>
                <xsl:value-of select="info[@nom='Cuisson' and @value]/@value"/>
            </Temp_cuisson>
            <Temp_repos>
                <xsl:value-of select="info[@nom='Repos' and @value]/@value"/>
            </Temp_repos>
            <Description_preparation>

                <xsl:copy-of select="info[@nom='Préparation' and not( ./@value)]/child::*"/>

            </Description_preparation>
            <Note>
                <xsl:value-of select="info[@nom='note']/@value"/><!--pour selectioner la note-->
            </Note>
            <Recette_auteurs>
                <!-- metre tout les auteur qui ont fait cette recette -->
                <xsl:for-each select="info[@nom='auteur']">
                    <Recette_auteur >
                        <xsl:attribute name="Recette_auteur_id">
                            <xsl:value-of select="@value"/><!--pour selectioner l'id-->
                        </xsl:attribute>
                    </Recette_auteur>
                </xsl:for-each>
            </Recette_auteurs>
        </Recette>
    </xsl:template>
    <!-- _______________________ end of defining the recette template  _______________________  -->

    <!-- _______________________ begin of defining the Ingredient template  _______________________  -->
    <xsl:template match="//objet[@type = 'ingrédient']">
        <Ingredient>
            <xsl:attribute name="ingredient_id">
                <xsl:value-of select="@id"/><!--pour selectioner l'id-->
            </xsl:attribute>
            <!-- dois je  ajouter une un element ingredient recette pour trouver les recette dont fait partie un ingredient ???-->
            <Ingredient_nom>
                <xsl:value-of select='info[@nom="nom"]/@value'/>
            </Ingredient_nom>
            <Apport_energetique>
                <xsl:value-of select='info[@nom="Apport énergétique"]/@value'/>
            </Apport_energetique>
            <Saison>
                <xsl:value-of select='info[@nom="saison"]/@value'/>
            </Saison>
            <Descriptif>
                <xsl:copy-of select='info[@nom="descriptif"]/* '/>
            </Descriptif>
        </Ingredient>
    </xsl:template>
    <!-- _______________________ end of defining the Ingredient template  _______________________  -->

    <!-- _______________________ begin of defining the Auteur template  _______________________  -->

    <xsl:template match="//objet[@type = 'auteur']">
        <Auteur>
            <xsl:attribute name="Auteur_id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <Auteur_Nom>
              <xsl:value-of select='info[@nom="nom"]/@value'/>
            </Auteur_Nom>

            <Auteur_Prenom>
            <xsl:value-of
                    select=' info[@nom="prenom"]/@value'/>
            </Auteur_Prenom>
            <Age></Age>
            <Pays>
                <xsl:value-of select='info[@nom="pays"]/@value'/>
            </Pays>
            <Sexe>
                <xsl:value-of select='info[@nom="sexe"]/@value'/>
            </Sexe>
            <Bibliographie>
                <xsl:value-of select='info[@nom="biographie"]/@value'/>
            </Bibliographie>
            <Auteur_recettes>
                <xsl:for-each select='info[@nom="recette"]'>
                    <Auteur_recette>
                        <xsl:attribute name="auteur_recette_id">
                            <xsl:value-of select='@value'/>
                        </xsl:attribute>
                    </Auteur_recette>
                </xsl:for-each>
            </Auteur_recettes>
        </Auteur>
    </xsl:template>
    <!-- _______________________ end of defining the Auteur template  _______________________  -->

    <!-- _______________________ begin of defining the catégorie template  _______________________  -->
    <xsl:template match='//objet[@type = "catégorie"]'>
        <Categorie_plat>
            <xsl:attribute name="Categorie_plats_id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <Categorie_plat_nom>
                <xsl:value-of select='info[@nom="nom"]/@value'/>
            </Categorie_plat_nom>
            <Categorie_plat_desription>
                <xsl:copy-of select='info[@nom="descriptif"]/child::*'/>
            </Categorie_plat_desription>
            <!-- je doit recupere tout les soucategorie qui ont comme atribut info la categorie actuelle  -->
            <xsl:variable name="id_cat" select="@id"/>
            <xsl:for-each
                    select='//objet[@type = "sous-catégorie" and info/@nom = "catégorie" and info/@value = $id_cat]'>
                <Sous_categorie_plat>
                    <xsl:attribute name="Categorie_plats_id">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <Sous_categorie_plat_nom>
                        <xsl:value-of select='info[@nom="nom"]/@value'/>
                    </Sous_categorie_plat_nom>
                    <Sous_categorie_plat_description>
                        <xsl:value-of select='info[@nom="descriptif"]/*'/>
                    </Sous_categorie_plat_description>

                    <Sous_categorie_plat_recettes>
                        <xsl:variable name="sous_cat" select="@id"/>
                        <xsl:for-each
                                select='//objet[@type = "recette" and info/@nom = "sous-catégorie" and info/@value = $sous_cat]'>
                            <Sous_categorie_plat_recette>
                                <xsl:attribute name="Sous_categorie_plat_recette_id">
                                    <xsl:value-of select="@id"/>
                                </xsl:attribute>
                            </Sous_categorie_plat_recette>
                        </xsl:for-each>
                    </Sous_categorie_plat_recettes>
                </Sous_categorie_plat>
            </xsl:for-each>
        </Categorie_plat>
    </xsl:template>
    <!-- _______________________ end of defining the catégorie template  _______________________  -->

    <!-- _______________________ begin of defining the Produit template  _______________________  -->
    <xsl:template match="//objet[./@type = 'produit']">
        <Produit>
            <xsl:attribute name="produit_id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <Produit_Nom>
                <xsl:value-of select='info[@nom = "nom"]/@value'/>
            </Produit_Nom>
            <Produit_Ingredients>
                <xsl:for-each select='info[@nom="ingrédient"]'>
                    <Produit_Ingredient>
                        <xsl:attribute name="Produit_Ingredient_id">
                            <xsl:value-of select="@value"/>
                        </xsl:attribute>
                    </Produit_Ingredient>
                </xsl:for-each>
            </Produit_Ingredients>
        </Produit>
    </xsl:template>
    <!-- _______________________ end of defining the Produit template  _______________________  -->

    <!-- _______________________ begin of defining the t element found in the descriptions sections  _______________________  -->
   <!-- <xsl:template match="//t" >
        <xsl:copy-of select="./*"/>
    </xsl:template>-->
    <!-- _______________________ begin of defining the p element found in the descriptions sections  _______________________  -->
</xsl:stylesheet>