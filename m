Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hv77s-00041z-8T
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 09:37:16 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l547Z6Lr014545 for <openembedded-devel@openembedded.org>;
	Mon, 4 Jun 2007 09:35:06 +0200
Message-ID: <4663C0AC.7020804@dominion.kabel.utwente.nl>
Date: Mon, 04 Jun 2007 09:35:08 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>	<73D8EBA5-2F97-43F0-B474-6BD6B7023BA3@gmx.net>
	<ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>
In-Reply-To: <ae36f8040706032019q12a628fcte0325229297a9076@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l547Z6Lr014545
Subject: Re: problems doing bitbake task-base
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
X-List-Received-Date: Mon, 04 Jun 2007 07:37:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lu=C3=ADs Cargnini schreef:
> I modified my distro to angstrom, and the following happens:
> elf/dl-lookup.o.dt -MT
> /home/lvcargnini/puc/instramed/openembedded/tmp/work/glibc-2.6-r0

I think you mistyped something, since angstrom doesn't use glibc 2.6. See
http://www.angstrom-distribution.org/building-angstrom

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGY8CrMkyGM64RGpERAkYlAJ97kczQnhSFWRlMZL+ODLONl44NHACfUtdc
sYh+XI//+EujwtVBs54EULE=3D
=3DnBWA
-----END PGP SIGNATURE-----


