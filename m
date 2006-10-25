Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GcWZy-0004pN-RS
	for openembedded-devel@openembedded.org; Wed, 25 Oct 2006 02:25:10 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9P0P4vD001294 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2006 02:25:05 +0200
Message-ID: <453EAEE0.8020704@dominion.kabel.utwente.nl>
Date: Wed, 25 Oct 2006 02:25:04 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Report of QA issues with 'bitbake angstrom-image'
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
X-List-Received-Date: Wed, 25 Oct 2006 00:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I decided to use insane.bbclass to hunt down spurious .debug/ entries in .debug packages,
but insane.bbclass is so cool that I want to share the full list with you:

http://ewi546.ewi.utwente.nl/tmp/QA-issues.txt

I suspect we can ignore the .so warning for modules (gnumeric-plugins, abiword-plugins)
and debug packages, but that still leave a fair deal of packages to investigate.

Do we want to have bugs files against the offending packages, or are we going to work
trough this list the next few weeks?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFPq7gMkyGM64RGpERAusxAJ43lJc3kaj+qb4c2c0qAcLUIhBRugCcD4w9
daQrPLZ8YdJzfGgrFSJ0naE=
=NXLm
-----END PGP SIGNATURE-----


