# Das Package wird installiert
source("https://bioconductor.org/biocLite.R")
biocLite("rGADEM")
# Und aufgerufen
library("rGADEM")
# Leere Liste "pwd" wird definiert
pwd <- ""
# Path wird als Pfad der Testdatei des Packages definiert
path<- system.file("extdata/Test_100.fasta", package="rGADEM")
# FastaFile wird mit dem vorherigen Pfad definiert. Dieser Schritt ist eigentlich unnötig?
FastaFile <- paste(pwd, path, sep="")
# In Sequences wird der Inhalt des FastaFile als Klasse "DNAStringSet", welche vom Package verarbeitet werden kann, gespeichert
sequences <- readDNAStringSet(FastaFile, "fasta")
# Der Befehl GADEM führt eine Motif-Analyse durch, bei welcher ein Consensus-String mit möglichst geringer Abweichung ermittelt wird
gadem <- GADEM(sequences, verbose=1)
# Der Befehl consensus gibt diesen String aus
consensus(gadem)
# In pwm wird der Score für die jeweiligen Positionen gespeichert
pwm <- gadem@motifList[[1]]@pwm
# seqLogo gibt eine grafische Repräsentation (Motif Logo) des Scores aus. 
# Hieraus lässt sich ableiten, mit welcher Wahrscheinlichkeit welche Basenpaare im häufigsten Motiv vorkommen.
seqLogo(pwm)



# rGADEM aufgerufen
library("rGADEM")
# Leere Liste "pwd" wird definiert
pwd <- ""
# Path wird als Pfad der aus dem DNA-Code der Vorlesung erstellten .fasta-Datei definiert
path<- "D:/Daten/Dokumente/fastatest.fasta"
# FastaFile wird mit dem vorherigen Pfad definiert. Dieser Schritt ist eigentlich unnötig?
FastaFile <- paste(pwd, path, sep="")
# In Sequences wird der Inhalt des FastaFile als Klasse "DNAStingSet", welche vom Package verarbeitet werden kann, gespeichert
sequences <- readDNAStringSet(FastaFile, "fasta")
# Der Befehl GADEM führt eine Motif-Analyse durch, bei welcher ein Consensus-String mit möglichst geringer Abweichung ermittelt wird. 
# Hierbei wird allerdings kein string gespeichert, vermutlich weil die Zeichenanzahl zu gering ist.
gadem <- GADEM(sequences, verbose=T, numGeneration=5)
# Der Befehl consensus sollte diesen String ausgeveb
consensus(gadem)
# In pwm würde der Score für die jeweiligen Positionen gespeichert
pwm <- gadem@motifList[[1]]@pwm
# seqLogo gäbe eine grafische Repräsentation (Motif Logo) des Scores aus
seqLogo(pwm)
