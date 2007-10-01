Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IcH2V-00053z-7T
	for openembedded-devel@openembedded.org; Mon, 01 Oct 2007 10:54:07 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l918n3Hh024210 for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Oct 2007 10:49:04 +0200
Message-ID: <4700B47F.4090802@student.utwente.nl>
Date: Mon, 01 Oct 2007 10:49:03 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47008E79.6020502@compulab.co.il>
	<19c1b8a90710010049y49effab8j739ecd884686199@mail.gmail.com>
In-Reply-To: <19c1b8a90710010049y49effab8j739ecd884686199@mail.gmail.com>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: tune-iwmmx vs tune-xscale
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
X-List-Received-Date: Mon, 01 Oct 2007 08:54:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Khem Raj schreef:
> tune-iwmmx.conf would be more appropriate

Actually, no. There are still problems left with things randomly segfaulting when
compiling everything with iwmmxt, so in OE we only activate iwmmxt for packages that
benefit from and and prove to be stable (e.g. mplayer).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHALR/MkyGM64RGpERAo9DAKCVeQPV0lIAgrxgSQj4Kg1vK1WWEgCgiMAV
9qA86YU6hgtwmy99Qs/pw+I=
=tGBi
-----END PGP SIGNATURE-----


