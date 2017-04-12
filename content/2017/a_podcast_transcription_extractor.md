;;title=A podcast transcription extractor
;;created=2017-04-12 23:16
;;category=PHP

When you are learning a foreign language, it is good to practice it - not only by speaking it but also by listening to it. And as I am learning French for some time now, I regularly listen to the "[Journal en français facile](https://savoirs.rfi.fr/fr/apprendre-enseigner/langue-francaise/journal-en-francais-facilE)" which is also available as a podcast. Until some time ago, the transcription of each episode was available directly in the podcast, but unfortunately that was removed and now the transcription is only available on the website. Because often I listen to the podcast on the train when there is no mobile internet connection available, I was looking for an easy workaround to get the translation to read it even if I am offline.

The first idea that came into my mind was to simply use my [wallabag](https://wallabag.org/) instance - just put a link to a transcription in it and let wallabag do the rest. - Unfortunately, that did not work out because wallabag is not able to extract the content of the webpage properly.

So, with some lines of PHP I created a kind of proxy that extracts the relevant content of a transcription webpage and writes it into an empty page. It also adds a good title to each page and offers a very basic navigation to the most recent transcriptions. You can get my script from GitHub: [PodcastTranscription.php](https://gist.github.com/tortlepp/a2cd1422719e229edf8d18401f40ef50)
