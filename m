Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UEQ6d-00048x-Jm
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Mar 2013 21:11:04 +0100
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 4D7A9EA040
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Mar 2013 21:10:35 +0100 (CET)
Received: by localhost (Postfix, from userid 1000)
	id B0FD9601DB; Sat,  9 Mar 2013 20:54:24 +0100 (CET)
Date: Sat, 9 Mar 2013 20:54:24 +0100
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130309195424.GA6272@hermes>
References: <cover.1362831936.git.apelete@seketeli.net>
	<73f5d1d2501d60fb20e3290d758e35aaf6b91e4c.1362831936.git.apelete@seketeli.net>
	<3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3C660C3C-34A4-4805-B6C0-E49AC8EEED55@gmail.com>
X-Operating-System: Debian GNU/Linux 7.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH v2 1/2] gnutls: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Mar 2013 20:11:07 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 09-Mar-13, Khem Raj a =E9crit:
>=20
> On Mar 9, 2013, at 4:38 AM, Apelete Seketeli <apelete@seketeli.net> wro=
te:
>=20
> > -SRC_URI =3D "ftp://ftp.gnutls.org/pub/gnutls/gnutls-${PV}.tar.bz2;na=
me=3Dgnutls"
> > +SRC_URI =3D "ftp://ftp.gnutls.org/gcrypt/gnutls/v2.10/gnutls-${PV}.t=
ar.bz2;name=3Dgnutls"
>=20
> can we use PV instead of 2.10 ? if not then move SRC_URI out of .inc in=
to .bb

PV is actually 2.10.4 here, it can't be used instead of 2.10 it seems.
I'll move SRC_URI into .bb then.

--=20
        Apelete


