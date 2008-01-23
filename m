Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1JHjWG-0001Zc-Ac
	for openembedded-devel@lists.linuxtogo.org;
	Wed, 23 Jan 2008 18:36:12 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0NHaAtS009761 for <openembedded-devel@lists.linuxtogo.org>;
	Wed, 23 Jan 2008 18:36:10 +0100
Message-ID: <47977B09.2060107@dominion.kabel.utwente.nl>
Date: Wed, 23 Jan 2008 18:36:09 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.linuxtogo.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: AVR32 branch merged
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
X-List-Received-Date: Wed, 23 Jan 2008 17:36:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

The avr32 branch Stelios and I have worked on for the past year or so
has been merged to .dev.

Known problems:

~ * kernel fails to link (workaround: use ld from atmel binary toolchain)
~ * tinylogin segfaults

This merge includes an avr32 optimized mplayer and a patched
xserver-kdrive for people with an lcd attached to their avr32 boards.

The recommended distro is angstrom-2008.1, which also gives you access
to pre-built packages from the angstrom feeds for avr32.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHl3sJMkyGM64RGpERAt4rAJoCAfClbk9yPwWSyGVUNAm7nwD9NgCfWERK
/c4lI7G4o2A9LR/g00ZWrIU=
=x7JX
-----END PGP SIGNATURE-----


