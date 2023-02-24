xquery version "3.1";

return(
<html lang="en">
<head>
       <title>Document</title>
</head>
<body>
<h2>liste des auteurs </h2>
<ul>
{for $auteur in //Auteur

return (
<li>
      {$auteur/Auteur_Nom/text()}{$auteur/Auteur_Prenom/text()}
      <ul>
        {
          for $auteurRecetteId in $auteur/Auteur_recettes/Auteur_recette/@auteur_recette_id
          return <li>{$auteurRecetteId}</li>
        }
      </ul>
 </li>
)
}
</ul>
</body>
</html>

)



