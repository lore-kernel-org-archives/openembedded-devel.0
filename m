Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S9FCo-0003rc-AC
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 13:27:26 +0100
Received: by wibhm17 with SMTP id hm17so2279540wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 05:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EdbvE+doFcYgl9WKo0wrthNQVhkbIhNqJAo6f37waPc=;
	b=k7I8cJ2grgORU2sR7bONwIjowjk+fDHdEdbV0MnTh6jIQ/Zm5m0JEW7JhZ5WL6I3gn
	XNg6/YjSCU+J4DCiDp0wpdGS0PIw0jeQJ+tYxEU38SEY7qu5uC3EH05FW4XFnxtP81vz
	po1Zc6ZwRzPUyM/6LOjSGx9xHa8k/ZXbrD4YhjiGnOOouxzpFyyR09XfqPX9BkrRPcab
	CDpgUdQyGg69Fq9wdZm5YOAHpIoX/2v1aHw3LELvt59+ySvBYcLBKboQJIebF/FgciT+
	TMPx6OHEvqxNiZxqQDM2gBIcLSk0FgP0iJrM08XRSeeoAEib/1AlwXoygzPn0BRgSFC/
	36uA==
Received: by 10.180.19.196 with SMTP id h4mr12228525wie.12.1332073116422;
	Sun, 18 Mar 2012 05:18:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p10sm21976412wic.0.2012.03.18.05.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 05:18:35 -0700 (PDT)
Date: Sun, 18 Mar 2012 13:18:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120318121834.GL3855@jama.jama.net>
References: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
	<jk4j25$dat$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jk4j25$dat$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] midori: Add project home page info
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
X-List-Received-Date: Sun, 18 Mar 2012 12:27:27 -0000
X-Groupsio-MsgNum: 37818
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline

--keoAwTxaagou87Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 18, 2012 at 01:05:20PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 16-03-12 20:41, Gary Thomas schreef:
> > Signed-off-by: Gary Thomas <gary@mlbassoc.com> ---=20
> > meta-oe/recipes-connectivity/midori/midori.inc |    1 + 1 files changed,
> > 1 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/meta-oe/recipes-connectivity/midori/midori.inc
> > b/meta-oe/recipes-connectivity/midori/midori.inc index 4c7147e..dccb3ee
> > 100644 --- a/meta-oe/recipes-connectivity/midori/midori.inc +++
> > b/meta-oe/recipes-connectivity/midori/midori.inc @@ -1,4 +1,5 @@=20
> > DESCRIPTION =3D "Midori is a lightweight web browser." +HOMEPAGE =3D
> > "http://www.twotoasts.de/index.php?/pages/midori_summary.html" LICENSE =
=3D
> > "LGPLv2.1" LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c24"
>=20
> Missing PR bump

Khem applied it before my version upgrade, so it should be fine in
feeds.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9l0poACgkQN1Ujt2V2gBzDLQCdH149UMr58saqqlhcFEtRsr8h
ZDwAn3RziIU8LVLk37cXnHtKx1asxv92
=H14X
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--
