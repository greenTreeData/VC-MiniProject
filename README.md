# Visió per computadors - Projecte

## Pipe-line proposat

## Distribució dels arxius

* getDataSet.m -> script de MATLAB per construir un data set amb el vector de característiques.
* preProcesing.m -> funció MATLAB que preprocesa la imatge abans de calcular el vector de característiques.
* calcCaracteristicas.m -> funció de MATLAB que rep una imatge i retorna un vector de característiques.
* predicions.m -> Script de MATLAB que carrega un model entrenat i demana una imatge, el resultat es la predicció de la senyal.


## Objectius

1. Programa MATLAB que entreni i validi el sistema de reconeixement proposat. Sempre és recomanable repetir les etapes 2,3 i 4 usant diferents folds i promitjar els resultats (cross-validation) .
2. Programa MATLAB que implementi el sistema de reconeixement de senyals de trànsit:
* Entrada : Ha de demanar el nom del fitxer amb la imatge que volem processar
* Sortida: Classe a la que pertany el senyal.
3. Documentació. Cal que lliureu un informe contenint:
   * Enumeracio i descripció de les característiques utilitzades per a modelitzar els senyals.
   * Descripció dels classificadors utilitzats
   * Descripció dels experiments realitzats
   * Resultats obtinguts. No oblideu la matriu de confusió.
   * Descripció de les funcions utilitzades, deixant ben clar quines són les implementades per vosaltres
   * Tot el software provinent d'altres fonts, ha d'estar correctament referenciat. EN CAS CONTRARI ES CONSIDERARÀ PLAGI.
   * Un annex amb tot el codi.

Es valorarà:
* Justificació de l'elecció dels descriptors i els classificadors
* Qualitat dels descriptors utilitzats per a modelitzar els senyals.
* Resultats obtinguts.
* Rigor en l'experimentació. Presentació formal de resultats, usant els indicadors stàndard d'avaluació d’una classificació presentats al curs.

Valoracions extra:
* Un anàlisi de significància (i no-redundància) de les característiques emprades.
* Afegir una classe reject ('desconegut') per detectar aquelles imatges que no pertanyin a cap de les 43 classes.

