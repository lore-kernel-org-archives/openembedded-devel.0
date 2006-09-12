Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GNDrg-0002aW-JY
	for openembedded-devel@openembedded.org; Tue, 12 Sep 2006 21:24:12 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8CJKdw4030435 for <openembedded-devel@openembedded.org>;
	Tue, 12 Sep 2006 21:20:39 +0200
Message-ID: <4507088A.5020506@dominion.kabel.utwente.nl>
Date: Tue, 12 Sep 2006 21:20:42 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <200609121228.26077.openembedded@hrw.one.pl>	<4506F6A1.2030201@am.sony.com>
	<5D8A40FF-284B-4C2C-B95B-E40218919ECB@inf.fu-berlin.de>
In-Reply-To: <5D8A40FF-284B-4C2C-B95B-E40218919ECB@inf.fu-berlin.de>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Paid support offer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2006 19:24:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> E.g. I'm slowly, but steadily,  
> working on infrastructure to increase the quality of BitBake,  
> OpenEmbedded and the packages we build.

yay!

> As
> long as the result will be freely available I'm confident everyone  
> would be happy to see an entitty helping or contracting someone.

+1 on that.

I think OE has reached a point where it needs more infrastructure to do (automated) QA and
regression testing. We can solve that in more than one way, but the 2 most obvious are:

1) Formulate a plan and ruless for '3rd parties' to do testing (think tinderbox)
2) have some 'OE owned' boxen somewhere that QA and regeression test the vital parts.

Both are fairly orthogonal and can be worked on independantly. I think we should discuss
both at OEDEM to get all the noses to point in the same direction.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFBwiKMkyGM64RGpERApr9AJ9Om/c2XqrMdC0z1z910z56jakcFwCfUq6O
1QomorYF4KoWn9WcjZb5oGM=
=ErPO
-----END PGP SIGNATURE-----


