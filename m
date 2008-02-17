Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JQlRX-0004UU-Eh
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 16:28:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JQlR0-0001Lv-0F
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 15:28:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 15:28:05 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 15:28:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 17 Feb 2008 16:27:59 +0100
Message-ID: <fp9jpv$3b5$1@ger.gmane.org>
References: <200802171526.21023.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
In-Reply-To: <200802171526.21023.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FOSDEM (1 week left)
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
X-List-Received-Date: Sun, 17 Feb 2008 15:28:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
| Hi folks,
|
| since it seems I'm the only one interested in PR material, there's no
point in
| waiting until someone else does it ;) I have attached a proposal,
please at
| least give me some input to make this a) include the most important
points
| and b) read like english.

"OpenEmbedded is Debian-based" - It isn't, the distros built with it
*might* be.

"Quality Assurance is achieved through automated sanity tests at build
time and runtime -- using the Qemu emulator." - We don't use qemu for
that, but insane.bbclass and testlab.bbclass.

"GCC Toolchains for a variety of target architectures like arm, mips,
ppc, i386, including lots of variants and ﬂavours" - Mention avr32 there.

"Flashable Images integrate a package management system" - Mention .ipk
and .deb there (how's .rpm nowadays?).

"Examples include award-winning distributions like OpenZaurus, Ångström,
Familiar Linux, OpenSIMpad, OpenDreambox, OpenSlug, and OpenMoko. " - At
least OZ, familiar and OS are dead, so better mention them after
Angstrom, SlugOs, OpenDreambox and OpenMoko.

One point I'm missing is "customization", be it CFLAGS or shlib
renaming, it is one of the main features of OE.

Apart from those small points it's looking pretty good.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHuFJ+MkyGM64RGpERAl7UAJ47l+hD1Ger8l51o/7VKZvzoz7PYwCfdyqK
GjMbZM+0N1FlVWvuGqSQ7Fc=
=iolo
-----END PGP SIGNATURE-----



