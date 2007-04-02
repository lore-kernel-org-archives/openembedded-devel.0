Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HYKo2-0006Z7-VV
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 13:34:39 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l32BY6ox016157; Mon, 2 Apr 2007 13:34:06 +0200
Message-ID: <4610EA2B.3000703@dominion.kabel.utwente.nl>
Date: Mon, 02 Apr 2007 13:34:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1175383522.5852.21.camel@localhost.localdomain>
	<912610941.20070402093449@vanille-media.de>
In-Reply-To: <912610941.20070402093449@vanille-media.de>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: Fixing OE.dev dependency issues
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
X-List-Received-Date: Mon, 02 Apr 2007 11:34:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> Richard Purdie wrote:
>> http://www.rpsys.net/openzaurus/temp/oe-depends-fixes.patch
> 
>> but of course once we do this, bitbake 1.6 is no longer going to work
>> with the metadata since this change is not backwards compatible.
> 
> This shouldn't be a problem for most people. I guess only a handful of
> insane projects like OpenMoko were brave enough to patch BitBake ;)
> 
>> I'm proposing to release bitbake 1.8.2 with code to handle the above,
>> and epoch handling code in the very near future. We will then have to
>> aim to make bitbake 1.8.2 the minimum bitbake version for .dev before
>> the above fix can be checked in and epoch packages can be more
>> widely/easily used. Does anyone have any objections to a move to bitbake
>> 1.8 in due course? What timescale would people class as acceptable?
> 
> 2 months after announcing?

2 months is awfully long from an OE perspective, but I see your point. Maybe we should
have a page that shows when various intrusive patches are going to be committed?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGEOorMkyGM64RGpERArtxAKCcMdlXhf72TqMYOkMv5rtyb/9U3QCgtTix
SqCJ7U164epjVNATF1xtFuU=
=rUvg
-----END PGP SIGNATURE-----


