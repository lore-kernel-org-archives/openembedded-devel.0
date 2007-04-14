Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <oe@hentges.net>) id 1HcizP-0004Wn-Pp
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Apr 2007 16:12:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 6900E3081F1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 16:12:16 +0200 (CEST)
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13669-05 for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 16:12:13 +0200 (CEST)
Received: from mhcln04.hentges.priv (xdsl-81-173-229-195.netcologne.de
	[81.173.229.195]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 276373081E9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 16:11:53 +0200 (CEST)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <3ef3a7ad0704140545j18e0ce1aib8a707966b74f313@mail.gmail.com>
References: <8A93ACC2-066E-41CE-AAD7-B869EF79B8F5@selfish.org>
	<3ef3a7ad0704140545j18e0ce1aib8a707966b74f313@mail.gmail.com>
Date: Sat, 14 Apr 2007 16:11:52 +0200
Message-Id: <1176559912.7958.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at hentges.net
Subject: Re: [RFC] Removal of GPL recipes
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
X-List-Received-Date: Sat, 14 Apr 2007 14:12:32 -0000
X-Groupsio-MsgNum: 1862
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-VTjjL4utaGVKHIM6mh6b"

--=-VTjjL4utaGVKHIM6mh6b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 14.04.2007, 13:45 +0100 schrieb Jos=E9 Bernardo Bandos
Rodrigues:
> I'm not sure I get this one - you're proposing to remove those recipes
> because they are GPL licensed?

There is some sort of policy that all OE recieped must be MIT licensed
(to ease corporate usage IIRC). But this policy of course only covers
the .bb file itself, not any software built with it.

--=20
Matthias 'CoreDump' Hentges=20
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice



--=-VTjjL4utaGVKHIM6mh6b
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGIOEoPXyoPq8wMNkRAriOAJ9/49n4TchtPx1HUctV+OF9FqvS7gCgxd9z
iYOHGjLE+FXd30fGJCToSGk=
=K0Oe
-----END PGP SIGNATURE-----

--=-VTjjL4utaGVKHIM6mh6b--
