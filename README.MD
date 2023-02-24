# Rapport 
## Description du projet 
### But
- Acquérir une compréhension approfondie de la structure des fichiers XML, y compris la syntaxe et l'utilisation des balises.
- Apprendre à vérifier la structure d'un fichier XML en utilisant les techniques de vérification DTD et XSD.
- Apprendre à transformer un fichier XML en utilisant XSLT, y compris la création de templates et de règles de transformation.
- Apprendre XPath, qui est une langue de requête utilisée pour accéder aux données dans un fichier XML, et qui a été utilisé dans le XSLT pour sélectionner des éléments spécifiques.

### Ce qui a été fait :

- Création d'une DTD conforme à celle décrite dans le TP1. Le résultat est le fichier **Recettes.dtd**.
- Transformation du fichier **donnees-recettes/donnees-recettes.xml** en un autre fichier XML qui respecte la DTD **Recettes.dtd**. Le résultat est le fichier **transformedDonneesRecettes.xml**.
- Transformation du fichier **transformedDonneesRecettes.xml** en un site web statique en utilisant le fichier **siteMaker.xslt**. Le résultat de cette transformation est le dossier **html**, qui contient les pages HTML.
- Ajout du dossier **style**, qui contient les fichiers CSS, dans le dossier **html**.
- Génération du schéma XSD correspondant au fichier transformé **transformedDonneesRecettes.xml**. Ajout de plusieurs restrictions et vérification des identifiants (ID) et références d'identifiants (IDREF).

## Outils utilisés
Éditeur de code : IntelliJ IDEA, utilisé pour exécuter les processus de transformation et de validation.