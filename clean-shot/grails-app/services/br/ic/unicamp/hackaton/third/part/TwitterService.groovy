package br.ic.unicamp.hackaton.third.part

import org.scribe.model.Token

import twitter4j.Status
import twitter4j.StatusUpdate
import twitter4j.Twitter
import twitter4j.TwitterException
import twitter4j.TwitterFactory
import twitter4j.auth.AccessToken;
import br.ic.unicamp.hackaton.anuncio.Anuncio

class TwitterService {
	
	static transactional = false
	
	public void tweetNovoAnuncio(Token accessToken, Anuncio novoAnuncio)
		throws TwitterException {
		if(!novoAnuncio) return
		
		TwitterFactory factory = new TwitterFactory()
		Twitter twitter = factory.getInstance()
		
		AccessToken twitterToken = new AccessToken(accessToken.getToken(), accessToken.getSecret())
		twitter.setOAuthAccessToken(twitterToken)

		String titulo = (novoAnuncio?.titulo?.length() < 75) ? novoAnuncio?.titulo : novoAnuncio?.titulo?.substring(0, 75) + ".."
		StatusUpdate statusUpdate = new StatusUpdate(String.format("Um novo anuncio foi criado: %s. #cleanshot #hackaton", titulo))

		Status status = twitter.updateStatus(statusUpdate)
		if(!status) throw new TwitterException("Problemas ao publicar o tweet!")
	}

}
