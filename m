Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J4Ndp-0003W5-IF
	for openembedded-devel@openembedded.org; Mon, 17 Dec 2007 22:36:49 +0100
Received: from Powerbook-2.local (vpn006097.vpn.utwente.nl [130.89.6.97])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBHLVnfr026241 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 22:31:50 +0100
Message-ID: <4766EAC5.10906@student.utwente.nl>
Date: Mon, 17 Dec 2007 22:31:49 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4765E992.2040805@protium.com>	<4710722265.20071217130911@gmail.com>	<47668695.5010701@protium.com>
	<828321445.20071217170249@gmail.com> <4766BEA8.1020709@protium.com>
In-Reply-To: <4766BEA8.1020709@protium.com>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 21:36:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andy Wilcox schreef:

> A few kernels will need to add the u-boot-utils-native dependency,
> notably the linkstation.  I'll make these adjustments in the commit.

And witness the joys of using linux.inc: automagic dependency on mkimage
for machines that need it!

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHZurFMkyGM64RGpERAtRaAJ4j2Q7fVMLaY7JbEazogWro3iYIZgCggkdD
aeY0fFxhJWIZN+J5cHXlRcE=
=Fsd1
-----END PGP SIGNATURE-----


