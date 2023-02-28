# Installazione e configurazione dell'ambiente di sviluppo

## Introduzione
Queste istruzioni di base ti aiuteranno a iniziare a lavorare con Symfony e React utilizzando un ambiente di sviluppo Dockerizzato.

## Prerequisiti
Prima di iniziare, assicurati di avere installato Docker e Git sul tuo computer. Puoi scaricare Docker dal sito ufficiale https://www.docker.com/products/docker-desktop e Git dal sito ufficiale https://git-scm.com/downloads.

## Fork
Per iniziare a lavorare all'applicazione, devi effettuare il fork di questo repository. Per farlo, puoi cliccare [qui](https://github.com/caprionlinesrl/job-devj1/fork) oppure sul pulsante "Fork" situato in alto a destra della pagina del repository su GitHub.com. In questo modo verrà creata una copia del repository all'interno del tuo account GitHub, sulla quale potrai lavorare liberamente.

## Configurazione
Poi clona il repository sul tuo computer e configura i tuoi dati Git:
```
git clone git@github.com:GITHUB_ACCOUNT/job-devj1.git
cd job-devj1
git config user.email username@dominio.com
git config user.name "Nome Cognome"
```

Se non dovesse funzionare, puoi utilizzare altri modi per clonare il repository, ad esempio https oppure GitHub CLI.

## Avvio
Per avviare l'applicazione, esegui il comando `docker compose up`. Questo comando avvierà i container Docker necessari per eseguire l'applicazione completa.

## Accedi all'ambiente di sviluppo
Per accedere all'ambiente di sviluppo dell'applicazione, apri un altro terminale e utilizza il comando `./scripts/shell.sh`. Tutti i comandi successivi dovranno essere eseguiti in questo ambiente, quindi assicurati di utilizzare questo nuovo terminale per interagire con l'applicazione.

Se hai Windows, puoi utilizzare `./scripts/shell.cmd`.

## Dipendenze
Assicurati di installare le dipendenze PHP e NodeJS utilizzando i comandi `composer install` e `yarn install`, rispettivamente. Questi comandi leggono i file di configurazione del progetto e scaricano le dipendenze necessarie per eseguire l'applicazione.

## Database
Per inizializzare il database, esegui il comando `./scripts/init_db.sh`. Questo comando creerà il database e inizializzerà le tabelle e i dati di esempio.

## Watcher
Per visualizzare le modifiche in tempo reale durante lo sviluppo, utilizza il comando `yarn watch`. Questo comando monitora i file sorgente dell'applicazione e ricompila i file JavaScript e CSS quando vengono apportate modifiche.

## Accesso all'applicazione
L'applicazione è ora disponibile nel tuo browser all'indirizzo http://localhost. È inoltre possibile accedere a phpMyAdmin all'indirizzo http://localhost:8000 per gestire il database.
