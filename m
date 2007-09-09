Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IUN7n-0002hK-KX
	for openembedded-devel@openembedded.org; Sun, 09 Sep 2007 15:47:03 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l89DhxxP004938 for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Sep 2007 15:44:00 +0200
Message-ID: <46E3F898.6090607@student.utwente.nl>
Date: Sun, 09 Sep 2007 15:43:52 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: sane-srcrevs.inc content and update policy
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
X-List-Received-Date: Sun, 09 Sep 2007 13:47:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I want to start using sane-srcrevs.inc in angstrom soon, but I heard some sounds from
angstrom-derivatives about needing some bleeding-edge bits.

So I have a few questions:

* how can a SRC_REV-pn-${PN} be overriden in a clean way (e.g. SRC_REV-pn-foo = "now")?
* what goes into sane-srcrevs.inc (everything with positive def_pref?)?
* what policy will be set for updating it?

Having a complete sane-srcrevs.inc should fix the "can't build because berlios is down"
type of problems.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG4/iYMkyGM64RGpERAu9kAJ0a8x2CJtUltOfdvZsdV/frtVmhNQCgqcGL
yR77EbuouqFeIXqtkn3k98Y=
=o85w
-----END PGP SIGNATURE-----


