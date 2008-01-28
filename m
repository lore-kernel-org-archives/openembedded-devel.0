Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JJYox-0003DZ-4Z
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 19:35:03 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0SIYxnr021624 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 19:34:59 +0100
Message-ID: <479E2053.6090902@student.utwente.nl>
Date: Mon, 28 Jan 2008 19:34:59 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <479D9AA9.8020704@student.utwente.nl>	<20080128144821.1b6f2741@widy.localdomain>	<20080128154022.7d4584db@cimmeria>
	<200801281828.58780.mickey@vanille-media.de>
In-Reply-To: <200801281828.58780.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 18:35:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
| On Monday 28 January 2008 16:40:22 Graeme Gregory wrote:
|> On Mon, 28 Jan 2008 14:48:21 +0200
|>
|> Paul Sokolovsky <pmiscml@gmail.com> wrote:
|>> Hm, but why that file is in .dev branch at all? What was idea of
|>> removing 2007 .conf and leaving preferred-versions? Doing a grep, it
|>> is referenced only by angstrom-2007-for-openmoko.inc, so shouldn't it
|>> be merged there or renamed to make it clear that it relates more to
|>> openmoko?
|> I shall rename it later when I get a chance to indicate only OpenMoko
|> use it.
|
| How about making it generic-preferred-versions.inc hence resurrecting
| the "generic" distribution until we have the default versions configured
| enough, so that you can build without setting a DISTRO?

You can't build without setting a distro since among other things,
SRCREV is broken if you do that.
Besides not being named 'generic', what are the arguments against making
angstrom the 'generic' distro in OE? It's the closest thing of showing
off all features of OE *and* doing it the OE-way.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHniBTMkyGM64RGpERArq0AJ0cjZv0pmdssf4vAksIS3r0ntmPBgCfdUZQ
QvRF2JTsWDrVbDRPQOpMQho=
=DbcD
-----END PGP SIGNATURE-----


