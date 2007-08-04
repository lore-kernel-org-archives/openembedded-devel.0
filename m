Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IHKN2-0000LJ-Pi
	for openembedded-devel@openembedded.org; Sat, 04 Aug 2007 16:12:51 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l74EAMj1028303; Sat, 4 Aug 2007 16:10:22 +0200
Message-ID: <46B488C3.4080306@dominion.kabel.utwente.nl>
Date: Sat, 04 Aug 2007 16:10:11 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>, 
	"Dr. Mickey Lauer" <mickey@vanille-media.de>
References: <E1IH6Wi-0002Ri-S3@linuxtogo.org>
	<623121068.20070804154926@vanille-media.de>
In-Reply-To: <623121068.20070804154926@vanille-media.de>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev psplash: make openmoko psplash openmoko specific, not machine specific
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
X-List-Received-Date: Sat, 04 Aug 2007 14:13:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Michael Lauer schreef:
> koen commit wrote:
>> psplash: make openmoko psplash openmoko specific, not machine specific
> 
> mmh :/ I did it on purpose that way. Didn't you read my comment in the
> changelog?

Yes: "psplash: add OpenMoko branding".

Could you explain why you want *every* distro and *every* target image using psplash on
that device having a 'openmoko' splash?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGtIjDMkyGM64RGpERAgDOAJ9WKxg1AN93w3wU+oVzUGCtlPh/LgCfbsPo
Lmktxh1K+asxK16h3b8AX/c=
=Ovdd
-----END PGP SIGNATURE-----


