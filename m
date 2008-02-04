Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JLwjO-0007Ug-1i
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 09:31:10 +0100
Received: from Powerbook-2.local (vpn006017.vpn.utwente.nl [130.89.6.17])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m148VEnr019976 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2008 09:31:15 +0100
Message-ID: <47A6CD53.5020203@student.utwente.nl>
Date: Mon, 04 Feb 2008 09:31:15 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1201823499.20311.26.camel@localhost.localdomain>	<20080203210353.438dffaf@cimmeria>
	<200802040336.13498.mickey@vanille-media.de>
In-Reply-To: <200802040336.13498.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Monotone issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Feb 2008 08:31:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
| On Sunday 03 February 2008 22:03:53 Graeme Gregory wrote:
|> On Thu, 31 Jan 2008 23:51:39 +0000
|>
|> Richard Purdie <rpurdie@rpsys.net> wrote:
|>> The difficulty in fixing this simple problem along with the speed
|>> issues make me wonder if monotone is right for the future though? I
|>> do get put off making commits due to the lack of speed too...
|
| Agreed. It's starting to be unbearable again.
|
|> Sounds like it is time for our regular re-assessment of the use
|> of monotone. Maybe we should start another round of testing other
|> SCM systems again.
|
| Agreed. To add up on that, last month Graydon Hoare officially
announced his
| retiring from the monotone project. Not that this would have any short
term
| effect, but it adds up to general feeling of re-evaluation.

Since this all was triggered by a bad commit, we should evaluate commit
and review policy as well and ideally end up with something that can be
hooked up to http://review-board.org/.

| Ideally, we would collect candidates and experience reports pretty
soon and
| make a decision at or shortly after the next OE meeting (FOSDEM).

After, since at least 3 core developers won't be at FOSDEM.

regards,

Koen


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHps1TMkyGM64RGpERAj6NAJ9Q2hFba+aVBro12iBnV0PWUh1S0gCeNxd5
AQWY1x22VXHYj1yuBt+WjeU=
=Uyow
-----END PGP SIGNATURE-----


