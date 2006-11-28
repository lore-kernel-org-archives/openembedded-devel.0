Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gp3K6-0001vN-VS
	for openembedded-devel@openembedded.org; Tue, 28 Nov 2006 14:48:35 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kASDmKox012283; Tue, 28 Nov 2006 14:48:20 +0100
Message-ID: <456C3E23.3020005@dominion.kabel.utwente.nl>
Date: Tue, 28 Nov 2006 14:48:19 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1GoL26-00042N-IV@linuxtogo.org>
	<456C25C4.1070609@dominion.kabel.utwente.nl>
In-Reply-To: <456C25C4.1070609@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Rod Whitby <rwhitby@gmail.com>
Subject: Re: [oe-commits] org.oe.dev gcc-cross 4.1.1: fix libg* architecture bugs, closes #1265
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
X-List-Received-Date: Tue, 28 Nov 2006 13:48:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> koen commit schreef:
>> gcc-cross 4.1.1: fix libg* architecture bugs, closes #1265
> 
> The cset below only seems to work for machines that explicitly set PACKAGE_ARCH, which
> incidentally covers the machines I tested for (they include
> tune-{xscale,arm920t,athlonmp}.inc which sets PACKAGE_ARCH). Should we set it for each
> machine?

Thanks to Richard this is properly fixed in revision 9562dbacc0c8663cc9491b5869fd3ffa505a5e75

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFbD4jMkyGM64RGpERAgEfAJsHmQfa/E66qXJGxCRRnLGgPTT5eACgkzFL
ETIrJ7i8DaaxliBH60LX2vY=
=S/bm
-----END PGP SIGNATURE-----


