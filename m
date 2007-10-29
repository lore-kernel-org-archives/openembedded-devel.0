Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1ImRUe-0007Be-PS
	for openembedded-devel@openembedded.org; Mon, 29 Oct 2007 11:05:14 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9T9vMUo021077 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2007 10:57:22 +0100
Message-ID: <4725AE82.30401@student.utwente.nl>
Date: Mon, 29 Oct 2007 10:57:22 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <HOECLKEKOHLAMMGDLLBHGEIAMKAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHGEIAMKAA.skoroneos@digital-opsis.com>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev	conf/machine/include/tune-ppc405.inc : Move	TARGET_FPU =	"soft" to the tune file so its
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
X-List-Received-Date: Mon, 29 Oct 2007 10:05:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stelios Koroneos schreef:
> ok, point taken.
> It should default to TARGET_FPU = "soft" only if the
> distro/machine/local.conf don't define it differently
> i.e TARGET_FPU ?= "soft"

In OE when TARGET_FPU is unset, it means 'hardfloat', so their shouldn't
be any mention of TARGET_FPU in a machine.conf.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHJa6CMkyGM64RGpERAt3gAJkBYy9k1Dl0eAwzVXc8zP7H0elnSACeOhBZ
j3XmEsMtX8NkgZyI1OT7WiY=
=2DFG
-----END PGP SIGNATURE-----


