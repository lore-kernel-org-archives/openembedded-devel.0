Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gn1Ig-0007SW-LP
	for openembedded-devel@openembedded.org; Thu, 23 Nov 2006 00:14:42 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAMNBgLr030431 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2006 00:11:42 +0100
Message-ID: <4564D92B.6080500@dominion.kabel.utwente.nl>
Date: Thu, 23 Nov 2006 00:11:39 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061120043254.GA19760@twibble.org>	<1616846329.20061122174526@gmail.com>
	<20061122230754.GA20164@twibble.org>
In-Reply-To: <20061122230754.GA20164@twibble.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Changes to populate-volatile.sh / new volatiles class
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
X-List-Received-Date: Wed, 22 Nov 2006 23:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> That update-alternatives thing on the
> other hand I have definately been thinking about redoing in C when I
> get a chance - it's painfully slow.

The good folks from o-hand.conf gave us this:
http://www.openembedded.org/filebrowser/org.openembedded.dev/packages/update-alternatives

I think it would be wise to move to the dpkg version and if that's still to slow, re-do it
in C.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFZNkqMkyGM64RGpERAp4iAJ42BT/OmrNvBlMEFxXPo93VCh+SSQCeNayR
CsT0cA8h4b7Ma0sE4E4uRcw=
=zLG/
-----END PGP SIGNATURE-----


