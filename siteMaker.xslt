<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes"/>
    <xsl:template match="/">

        <xsl:result-document href="./html/index.html">
            <html>
                <head>
                    <title>
                        <xsl:text>home site</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>


                    <xsl:call-template name="navBar"/>
    <h1 class="container">Contenu du site</h1>
                    <!-- begin applying Auteurs List  template -->
                    <xsl:call-template name="auteurs-list">
                        <xsl:with-param name="auteursList" select="//Auteur"/>
                    </xsl:call-template>
                    <!-- end applying Auteurs List template -->

                    <!-- begin applying Recette List  template -->
                    <xsl:call-template name="recettes-list">
                        <xsl:with-param name="recettesList" select="//Recette"/>
                    </xsl:call-template>
                    <!-- end applying Recette list template -->

                    <!-- begin applying Ingredients Liste template -->
                    <xsl:call-template name="ingredients-list">
                        <xsl:with-param name="ingredientsList" select="//Ingredient"/>
                    </xsl:call-template>
                    <!-- end applying Ingredients Liste template -->

                    <!-- begin applying Produits Liste template -->
                    <xsl:call-template name="produits-list">
                        <xsl:with-param name="produitsList" select="//Produit"/>
                    </xsl:call-template>
                    <!-- end applying Produits Liste template -->

                    <!-- begin applying categories plats Liste template -->
                    <xsl:call-template name="categories-plat-list">
                        <xsl:with-param name="categoriesPlatList" select="//Categorie_plat"/>
                    </xsl:call-template>
                    <!-- end applying categories Liste template -->

                    <!-- begin applying sous categories Liste template -->
                    <xsl:call-template name="sous-categories-plat-list">
                        <xsl:with-param name="sousCategoriesPlatList" select="//Sous_categorie_plat"/>
                    </xsl:call-template>


                    <!-- end applying sous categories Liste template -->

                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="./html/recettes.html">
            <html>
                <head>
                    <title>
                        <xsl:text>Recettes</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>

                    <xsl:call-template name="navBar"/>

                    <h1 class="container">Recettes</h1>
                    <!-- begin applying Recette  template -->
                    <xsl:call-template name="recettes-section">
                        <xsl:with-param name="recettesList" select="//Recette"/>
                    </xsl:call-template>
                    <!-- end applying Recette template -->
                </body>
            </html>
        </xsl:result-document>


        <xsl:result-document href="./html/auteurs.html">
            <html>
                <head>
                    <title>
                        <xsl:text>Autuers</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>
                    <xsl:call-template name="navBar"/>
                    <h1 class="container">Auteurs</h1>
                    <!-- begin applying Auteurs  template -->
                    <xsl:call-template name="auteurs-section">
                        <xsl:with-param name="auteursList" select="//Auteur"/>
                    </xsl:call-template>
                    <!-- end applying Auteurs template -->
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="./html/ingredients.html">
            <html>
                <head>
                    <title>
                        <xsl:text>ingredient</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>
                    <xsl:call-template name="navBar"/>
                    <h1 class="container">Ingredients</h1>
                    <!-- begin applying Ingredients  template -->
                    <xsl:call-template name="ingredients-section">
                        <xsl:with-param name="ingredientsList" select="//Ingredient"/>
                    </xsl:call-template>
                    <!-- end applying Ingredients template -->
                </body>
            </html>
        </xsl:result-document>


        <xsl:result-document href="./html/produits.html">
            <html>
                <head>
                    <title>
                        <xsl:text>Produits</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>
                    <xsl:call-template name="navBar"/>
                    <h1 class="container">Produits</h1>
                    <!-- begin applying Produits  template -->
                    <xsl:call-template name="produits-section">
                        <xsl:with-param name="produitsList" select="//Produit"/>
                    </xsl:call-template>
                    <!-- end applying Produits template -->
                </body>
            </html>
        </xsl:result-document>

        <xsl:result-document href="./html/categories.html">
            <html>
                <head>
                    <title>
                        <xsl:text>categorie</xsl:text>
                    </title>
                    <link rel="stylesheet" href="style/css-reset.css"/>
                    <link rel="stylesheet" href="style/main-style.css"/>
                </head>
                <body>
                    <xsl:call-template name="navBar"/>
                    <h1 class="container">Categories</h1>
                    <!-- begin applying categories  template -->
                    <xsl:call-template name="categories-plat-section">
                        <xsl:with-param name="categoriesPlatList" select="//Categorie_plat"/>
                    </xsl:call-template>
                    <!-- end applying categories template -->
                </body>
            </html>
        </xsl:result-document>

    </xsl:template>

    <!-- ______________________template definition ______________________-->
    <!-- begin Auteurs List  template -->
    <xsl:template name="auteurs-list">
        <xsl:param name="auteursList"/>
        <div class="container">
            <h2>Auteurs</h2>
            <ul>
                <xsl:for-each select="$auteursList">
                    <li>
                        <a>
                            <xsl:attribute name="href">auteurs.html#<xsl:value-of select="@Auteur_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Auteur_Nom"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="Auteur_Prenom"/>
                        </a>
                        <xsl:value-of select="Titre"/>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end Auteurs List  template -->

    <!-- begin Auteurs template -->
    <xsl:template name="auteurs-section">
        <xsl:param name="auteursList"/>
        <div class="auteurs container">
            <xsl:for-each select="$auteursList">
                <xsl:sort select="Auteur_Nom" order="ascending" data-type="text"/>
                <xsl:sort select="Auteur_Prenom" order="ascending" data-type="text"/>
                <xsl:variable name="auteurId">
                    <xsl:value-of select="@Auteur_id"/>
                </xsl:variable>
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="$auteurId"/>
                    </xsl:attribute>
                    <h2>
                        <xsl:value-of select="Auteur_Nom"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="Auteur_Prenom"/>
                    </h2>
                    <xsl:if test="Age/text()">
                        <p>
                            <xsl:value-of select="Age"/>
                        </p>
                    </xsl:if>
                    <xsl:if test="Pays/text()">
                        <h3>Pays</h3>
                        <p>
                            <xsl:value-of select="Pays"/>
                        </p>
                    </xsl:if>
                    <xsl:if test="Bibliographie/text()">
                        <h3>Bibliographie</h3>
                        <p>
                            <xsl:value-of select="Bibliographie"/>
                        </p>
                    </xsl:if>

                    <h3>Recettes</h3>
                    <ul>
                        <xsl:for-each select="//Recette[Recette_auteurs/Recette_auteur/@Recette_auteur_id = $auteurId]">
                            <li>
                                <a>
                                    <xsl:attribute name="href">recettes.html#<xsl:value-of select="@recette_id"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="Titre"/>
                                </a>
                            </li>
                        </xsl:for-each>

                    </ul>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- end Auteurs template -->


    <!-- begin Recettes List template -->
    <xsl:template name="recettes-list">
        <xsl:param name="recettesList"/>
        <div class="container">
            <h2>Recettes</h2>
            <ul>
                <xsl:for-each select="$recettesList">
                    <xsl:sort select="Date_publication" order="descending"/>
                    <li>
                        <a>
                            <xsl:attribute name="href">recettes.html#<xsl:value-of select="@recette_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Titre"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end Recettes List template -->

    <!-- begin Recettes Template -->

    <xsl:template name="recettes-section">
        <xsl:param name="recettesList"/>

        <div class="recettes container">
            <xsl:for-each select="$recettesList">

                <xsl:sort select="Date_publication" order="descending" data-type="text"/>
                <xsl:variable name="recetteId" select="@recette_id"/>

                <div class="recette">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@recette_id"/>
                    </xsl:attribute>

                    <h2>
                        <xsl:value-of select="Titre"/>
                    </h2>

                    <p>
                        <xsl:value-of select="Resume"/>
                    </p>
                    <img>
                        <xsl:attribute name="src">
                            <xsl:value-of select="Photo/Url"/>
                        </xsl:attribute>
                        <xsl:attribute name="alt">
                            <xsl:value-of select="Photo/Description"/>
                        </xsl:attribute>
                    </img>
                    <p>
                        Recette publiée le
                        <xsl:value-of select="Date_publication"/>
                    </p>
                    <xsl:if test="Dificulte/text()">
                        <p>
                            Difficulté
                            <xsl:value-of select="Dificulte"/>
                        </p>
                    </xsl:if>
                    <xsl:if test="Nombre_perssone/text()">
                        <p>

                            POUR
                            <xsl:value-of select="Nombre_perssone"/> PERSSONES
                        </p>
                    </xsl:if>

                    <xsl:if test="Temp_preparation/text()">
                        <p>
                            Temp de préparation :
                            <xsl:value-of select="Temp_preparation"/>
                        </p>
                    </xsl:if>

                    <xsl:if test="Temp_cuisson/text()">
                        <p>
                            Temps de cuisson :
                            <xsl:value-of select="Temp_cuisson"/>
                        </p>

                    </xsl:if>
                    <xsl:if test="Temp_repos/text()">
                        <p>
                            Temps de repos
                            <xsl:value-of select="Temp_repos"/>
                        </p>
                    </xsl:if>

                    <xsl:if test="Description_preparation/text()">
                        <h3>PREPARATION</h3>
                        <p>
                            <xsl:copy-of select="Description_preparation"/>
                        </p>
                    </xsl:if>
                    <h3>Auteurs</h3>
                    <ul>
                        <xsl:for-each select="Recette_auteurs/Recette_auteur">

                            <xsl:variable name="idAuteur" select="@Recette_auteur_id"/>
                            <li>
                                <a>
                                    <xsl:attribute name="href">auteurs.html#<xsl:value-of select="$idAuteur"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//Auteur[@Auteur_id = $idAuteur]/Auteur_Nom"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="//Auteur[@Auteur_id = $idAuteur]/Auteur_Prenom"/>
                                </a>
                                <xsl:value-of select="Titre"/>
                            </li>

                        </xsl:for-each>
                    </ul>
                    <h3>Ingrédients</h3>
                    <ul>
                        <xsl:for-each select="Recette_ingredients/Recette_ingredient">
                            <xsl:variable name="idIngredient" select="@Recette_ingredient_id"/>
                            <li>
                                <a>
                                    <xsl:attribute name="href">ingredients.html#<xsl:value-of select="$idIngredient"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//Ingredient[@ingredient_id = $idIngredient]/Ingredient_nom"/>
                                </a>
                                <xsl:value-of select="Titre"/>
                            </li>
                        </xsl:for-each>
                    </ul>
                    <h3>sous categorie</h3>
                    <ul>
                        <xsl:for-each
                                select="//Sous_categorie_plat[Sous_categorie_plat_recettes/Sous_categorie_plat_recette/@Sous_categorie_plat_recette_id = $recetteId]">

                            <li>
                                <a>
                                    <xsl:attribute name="href">categories.html#<xsl:value-of
                                            select="@Categorie_plats_id"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="Sous_categorie_plat_nom"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>


                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- begin Recettes Template -->


    <!-- begin Ingredients List template -->
    <xsl:template name="ingredients-list">
        <xsl:param name="ingredientsList"/>
        <div class="container">
            <h2>Ingrédients</h2>
            <ul>
                <xsl:for-each select="$ingredientsList">
                    <li>
                        <a>
                            <xsl:attribute name="href">ingredients.html#<xsl:value-of select="@ingredient_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Ingredient_nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end Ingredients List template -->

    <!-- begin Ingredients Template -->
    <xsl:template name="ingredients-section">
        <xsl:param name="ingredientsList"/>

        <div class="ingredients container">
            <xsl:for-each select="$ingredientsList">
                <xsl:variable name="ingredientId">
                    <xsl:value-of select="@ingredient_id"/>
                </xsl:variable>

                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@ingredient_id"/>
                    </xsl:attribute>

                    <h2>
                        <xsl:value-of select="Ingredient_nom"/>
                    </h2>
                    <xsl:if test="Apport_energetique/text()">
                        <h3 style="display: inline ; ">Apport Calorique</h3>
                        <span>
                            <xsl:value-of select="Apport_energetique"/>
                        </span>
                    </xsl:if>
                    <p>
                        <xsl:value-of select="Saison"/>
                    </p>
                    <h3>Descriptif </h3>
                        <xsl:copy-of select="Descriptif"/>

                    <h3>Liste des recettes contenant cet ingrédient</h3>
                    <ul>
                        <xsl:for-each
                                select="//Recette[Recette_ingredients/Recette_ingredient/@Recette_ingredient_id = $ingredientId]">
                            <li>
                                <a>
                                    <xsl:attribute name="href">recettes.html#<xsl:value-of select="@recette_id"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="Titre"/>
                                </a>
                            </li>
                        </xsl:for-each>

                    </ul>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- end Ingredients Template -->

    <!-- begin Produits List template -->
    <xsl:template name="produits-list">
        <xsl:param name="produitsList"/>
        <div class="container">
            <h2>Produits</h2>
            <ul>
                <xsl:for-each select="$produitsList">
                    <li>
                        <a>
                            <xsl:attribute name="href">produits.html#<xsl:value-of select="@produit_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Produit_Nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end Produits List template -->
    <!-- begin  Produits template -->
    <xsl:template name="produits-section">
        <xsl:param name="produitsList"/>
        <div class="produits container">
            <xsl:for-each select="$produitsList">
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@produit_id"/>
                    </xsl:attribute>
                    <h2>
                        <xsl:value-of select="Produit_Nom"/>
                    </h2>
                    liste de ses ingredient :
                    <xsl:if test="count(Produit_Ingredients/Produit_Ingredient)>0">
                        <ul>
                            <xsl:for-each select="Produit_Ingredients/Produit_Ingredient">
                                <xsl:variable name="produitId" select="@Produit_Ingredient_id"/>
                                <li>
                                    <a>
                                        <xsl:attribute name="href">ingredients.html#<xsl:value-of select="$produitId"/>
                                        </xsl:attribute>
                                        <xsl:value-of
                                                select="//Ingredient[@ingredient_id = $produitId]/Ingredient_nom"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- end Produits template -->

    <!-- categories plat List template -->
    <xsl:template name="categories-plat-list">
        <xsl:param name="categoriesPlatList"/>
        <div class="container">

            <h2>Categories</h2>
            <ul>
                <xsl:for-each select="$categoriesPlatList">
                    <li>
                        <a>
                            <xsl:attribute name="href">categories.html#<xsl:value-of select="@Categorie_plats_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Categorie_plat_nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end categories plat List template -->
    <!-- begin  categories plat template -->
    <xsl:template name="categories-plat-section">
        <xsl:param name="categoriesPlatList"/>
        <div class="categories-plat container">
            <xsl:for-each select="$categoriesPlatList">
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@Categorie_plats_id"/>
                    </xsl:attribute>
                    <h2>
                        <xsl:value-of select="Categorie_plat_nom"/>
                    </h2>
                    <p>
                        <xsl:copy-of select="Categorie_plat_desription"/>
                    </p>

                    <xsl:if test="count(Sous_categorie_plat)>0">
                        <h3>sous categorie</h3>
                        <ul>

                            <xsl:for-each select="Sous_categorie_plat">
                                <li>
                                    <h4>
                                        <xsl:attribute name="id">
                                            <xsl:value-of select="@Categorie_plats_id"/>
                                        </xsl:attribute>
                                    </h4>
                                    <xsl:value-of select="Sous_categorie_plat_nom"/>
                                    <xsl:if test="count(Sous_categorie_plat_recettes/Sous_categorie_plat_recette)>0">
                                        <ul>
                                            <xsl:for-each
                                                    select="Sous_categorie_plat_recettes/Sous_categorie_plat_recette">
                                                <xsl:variable name="recetteId"
                                                              select="@Sous_categorie_plat_recette_id"/>
                                                <li>
                                                    <a>
                                                        <xsl:attribute name="href">recettes.html#<xsl:value-of
                                                                select="$recetteId"/>
                                                        </xsl:attribute>
                                                        <xsl:value-of
                                                                select="//Recette[@recette_id = $recetteId]/Titre"/>
                                                    </a>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>

                        </ul>
                    </xsl:if>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
    <!-- end categories plat template -->

    <!-- begin  sous categories plat List -->

    <xsl:template name="sous-categories-plat-list">
        <xsl:param name="sousCategoriesPlatList"/>
        <div class="container">
            <h2>Sous Categories</h2>
            <ul>
                <xsl:for-each select="$sousCategoriesPlatList">
                    <li>
                        <a>
                            <xsl:attribute name="href">categories.html#<xsl:value-of select="@Categorie_plats_id"/>
                            </xsl:attribute>
                            <xsl:value-of select="Sous_categorie_plat_nom"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>
    <!-- end sous categories plat List -->

    <!-- begin  sous categories plat template -->
    <xsl:template name="sous-categories-plat-section">
        <xsl:param name="sousCategoriesPlatList"/>
        <div class="sous-categories-plat container">
            <xsl:for-each select="$sousCategoriesPlatList">
                <div>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@Categorie_plats_id"/>
                    </xsl:attribute>
                    <h2>
                        <xsl:value-of select="Sous_categorie_plat_nom"/>
                    </h2>
                    <p>
                        <xsl:copy-of select="Sous_categorie_plat_description"/>
                    </p>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template name="navBar">

        <div class="topnav ">
            <div class="container">
            <a href="index.html">Accueil</a>

            <a href="recettes.html">Recettes</a>

            <a href="produits.html">Produits</a>

            <a href="auteurs.html">Auteurs</a>

            <a href="categories.html">Categories</a>

            <a href="ingredients.html">Ingredients</a>
        </div>


    </div>
</xsl:template>
        <!-- end sous categories plat template -->
        </xsl:stylesheet>