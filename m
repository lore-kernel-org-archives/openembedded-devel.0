Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Iitzz-0002ib-9C
	for openembedded-devel@openembedded.org; Fri, 19 Oct 2007 17:42:56 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9JFa1Uo023648 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2007 17:36:02 +0200
Message-ID: <4718CEE7.6010107@student.utwente.nl>
Date: Fri, 19 Oct 2007 17:36:07 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IitJp-0004tL-Jc@linuxtogo.org>
In-Reply-To: <E1IitJp-0004tL-Jc@linuxtogo.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev libfakekey: switch to SRCREV (from Poky)
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
X-List-Received-Date: Fri, 19 Oct 2007 15:43:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

hrw commit schreef:
> libfakekey: switch to SRCREV (from Poky)

> -PR="r2"
> -PV = "0.2+svn${SRCDATE}"
> +PV = "0.0+svnr${SRCREV}"

If that's intended, you forgot to do PE=1

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHGM7nMkyGM64RGpERAhE3AKCRN2fh0UKQrbPP0D9DbcZS2S8/VACgtbec
rnQ0WzBgfTKF6h/b2/ruB9o=
=sI93
-----END PGP SIGNATURE-----


