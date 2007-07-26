Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE0jd-00071h-Tu
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 12:38:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QAb01R006403 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 12:37:00 +0200
Message-ID: <46A87949.60709@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 12:36:57 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46A87161.9080105@dominion.kabel.utwente.nl>
In-Reply-To: <46A87161.9080105@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Please use mtn --author properly, was: Re: OE weekly changelog
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
X-List-Received-Date: Thu, 26 Jul 2007 10:38:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Alex:
>     initramfs: Add blockboot plugin and cleanup dependency handling.
>     initramfs-image: Revamped image for modular initramfs.
>     initramfs: New modular initramfs for booting kernel from various media.

mtn commit --author takes a keyname/email address, so please use

mtn commit <foo> --author "alex@bla.org"

and not

mtn commit <foo> --author "Alex Foo <alex@bla.org>"

since that will only save 'alex' to the db.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqHlJMkyGM64RGpERAm5MAJ4qqGEk4NAMvlazKZxfTnjsudXlIwCfbiy+
FJUdpCZJr8V47OinNJkEuMk=
=VphP
-----END PGP SIGNATURE-----


