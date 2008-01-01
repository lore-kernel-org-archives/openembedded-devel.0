Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1J9mHj-0004L1-1z
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jan 2008 19:56:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 8C34A308010
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:50:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id YF2BN0G+mrgc
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:49:58 +0100 (CET)
Received: from [192.168.5.10] (xdsl-87-79-213-37.netcologne.de [87.79.213.37])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id E0534308004
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jan 2008 19:49:57 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1067194706.20080101190354@gmail.com>
References: <E1J9k05-00006v-OV@linuxtogo.org>
	<1067194706.20080101190354@gmail.com>
Date: Tue, 01 Jan 2008 19:49:57 +0100
Message-Id: <1199213397.8062.62.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.2 
Subject: Re: [oe-commits] org.oe.dev gpsd: Provide working	default configuration and init-script for fic-gta01. This makes gpsd	device-specific for gta01, please check the feeds.
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
X-List-Received-Date: Tue, 01 Jan 2008 18:56:19 -0000
X-Groupsio-MsgNum: 3777
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6oprc/aVzYW1bBTkEUMF"

--=-6oprc/aVzYW1bBTkEUMF
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey there.=20

Am Dienstag, den 01.01.2008, 19:03 +0200 schrieb Paul Sokolovsky:
> Hello,
>=20
>       Working default configuration should go to ${PN}-conf or
> something, like most of OE does, and few remaining uncomplying packages a=
re
> being converted. This helps with build, QA, and release management. Thank=
s.
>=20

could you please point me to a sample package with acceptable
integration of -conf? I'd rather _not_ do this a third time.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-6oprc/aVzYW1bBTkEUMF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBHeotVPXyoPq8wMNkRAjLhAKCt4iJMhDqQXHnfvYka3J3u6K+0EgCeIqBP
XWL9mouGBRcfdFowmMJ3nHI=
=vNdE
-----END PGP SIGNATURE-----

--=-6oprc/aVzYW1bBTkEUMF--
