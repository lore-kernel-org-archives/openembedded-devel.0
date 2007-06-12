Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hy9Y6-0000dr-A0
	for openembedded-devel@openembedded.org; Tue, 12 Jun 2007 18:48:54 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5CGjjLr029448 for <openembedded-devel@openembedded.org>;
	Tue, 12 Jun 2007 18:45:50 +0200
Message-ID: <466ECDC8.4090909@dominion.kabel.utwente.nl>
Date: Tue, 12 Jun 2007 18:46:00 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <ae36f8040706021959p2c020f17k454aa346d7123f95@mail.gmail.com>	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>	<4666520C.8060000@dominion.kabel.utwente.nl>	<4666576A.9030608@dominion.kabel.utwente.nl>	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>	<ae36f8040706120817w7f643176k722d3477bdaaa2e4@mail.gmail.com>	<466EBA7A.9030606@dominion.kabel.utwente.nl>
	<ae36f8040706120934g447146b8l633358481c62dfb1@mail.gmail.com>
In-Reply-To: <ae36f8040706120934g447146b8l633358481c62dfb1@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.utwente.nl id
	l5CGjjLr029448
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
X-List-Received-Date: Tue, 12 Jun 2007 16:48:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lu=C3=ADs Cargnini schreef:
> ok first I use gentoo, so the command is emerge "=3Dgcc-3.4.6" =3D)
>=20
> I already did it so I have gcc-3 installed on my system and now ?

ln /usr/bin/gcc-3.4.6 /usr/bin/gcc-3.4 -s

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGbs3HMkyGM64RGpERAlUrAKCeN5N2E75ZE3yHM22uCYbJYjNXtgCgjsJS
b9puiA4q35quPrE+qCcuKhw=3D
=3D2Y4n
-----END PGP SIGNATURE-----


