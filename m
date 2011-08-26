Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qx1CB-00055N-7T
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Aug 2011 20:31:59 +0200
Received: by fxg11 with SMTP id 11so2938171fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2011 11:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=45bDG04ZLunY3QhWm0CF33LplkLGqnd++jT6wKrxKZw=;
	b=vN4lMIHXZhs7oMxgD572L3MskagaYC3aKZLrZAkV0JwptbGu0TmtFMRlDG7CEU8n6J
	PjSgolqGyzI5yki5/8rmPPUfEiu51SNIeOzlmwzurqbMzKmgl5LC9AJYvOP6oI3OlbnF
	923Hd0cVf4wx3qNnpoqhh6+YhxFD77K5cTGBo=
Received: by 10.223.22.8 with SMTP id l8mr2032850fab.105.1314383230438;
	Fri, 26 Aug 2011 11:27:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q23sm1535079faa.6.2011.08.26.11.27.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 11:27:09 -0700 (PDT)
Date: Fri, 26 Aug 2011 20:27:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110826182701.GK5081@jama.jama.net>
References: <1314364721-3871-1-git-send-email-Martin.Jansa@gmail.com>
	<j388t4$9u$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j388t4$9u$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] evas: add evas-loader-svg back to RRECOMMENDS
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
X-List-Received-Date: Fri, 26 Aug 2011 18:31:59 -0000
X-Groupsio-MsgNum: 33843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Rex5+51txc1ort/q"
Content-Disposition: inline

--Rex5+51txc1ort/q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2011 at 04:00:04PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 26-08-11 15:18, Martin Jansa schreef:
> > * it doesn't look like whole Gtk+ anymore, but still needs gdk-pixbuf, =
libcairo2 etc.
> >=20
> > Package: evas-loader-svg Depends: libxcb1 (>=3D 1.7), libxrender1 (>=3D=
 0.9.6), libpixman-1-0 (>=3D 0.22.2), libxml2 (>=3D 2.7.8), libz1 (>=3D 1.2=
=2E5), librsvg-2-2 (>=3D 2.32.1), libfreetype6 (>=3D 2.4.6), eina (>=3D 1.0=
=2E999+svnr62850), libgcrypt11 (>=3D 1.4.6), libpng12-0 (>=3D 1.2.46), libf=
fi5 (>=3D 3.0.9),
> > gdk-pixbuf (>=3D 2.22.1), libcairo2 (>=3D 1.10.2), libstdc++6 (>=3D 4.6=
=2E1+svnr175454), libglib-2.0-0 (>=3D 2.29.3+gitr1+d97cbc6731deab137770bc0f=
e9c69b06f689f5b4), libxau6 (>=3D 1.0.6), libjpeg8 (>=3D 8c), libx11-6 (>=3D=
 1.4.3), evas (>=3D 1.0.999+svnr62850), libfribidi0 (>=3D 0.19.2), libc6 (>=
=3D 2.13), pango (>=3D
> > 1.28.3), libgpg-error0 (>=3D 1.10), libgnutls26 (>=3D 2.12.5), libeet1 =
(>=3D 1.4.999+svnr62850), libtasn1-3 (>=3D 2.9), libexpat1 (>=3D 2.0.1), li=
bxdmcp6 (>=3D 1.1.0), libfontconfig1 (>=3D 2.8.0)
> >=20
> > Package: librsvg-2-2 Depends: libx11-6 (>=3D 1.4.3), libpixman-1-0 (>=
=3D 0.22.2), libxcb1 (>=3D 1.7), libc6 (>=3D 2.13), libxrender1 (>=3D 0.9.6=
), libffi5 (>=3D 3.0.9), libxml2 (>=3D 2.7.8), libz1 (>=3D 1.2.5), libfreet=
ype6 (>=3D 2.4.6), gdk-pixbuf (>=3D 2.22.1), libpng12-0 (>=3D 1.2.46), libc=
airo2 (>=3D 1.10.2),
> > libstdc++6 (>=3D 4.6.1+svnr175454), libglib-2.0-0 (>=3D 2.29.3+gitr1+d9=
7cbc6731deab137770bc0fe9c69b06f689f5b4), libxau6 (>=3D 1.0.6), libexpat1 (>=
=3D 2.0.1), pango (>=3D 1.28.3), libxdmcp6 (>=3D 1.1.0), libfontconfig1 (>=
=3D 2.8.0)
> >=20
> > * but otherwise e-wm keeps complaining about missing svg support <<<< E=
nlightenment Error >>>> Enlightenment found Evas can't load SVG files. Chec=
k Evas has SVG loader support.
> >=20
> > * we can also RRECOMMEND it only from e-wm, so people using only evas w=
ithout e-wm won't get it by default
>=20
> whatever option you choose, you must bump PR :)

Ah, my plan was to send it as RFC and then if decided to add it back
push it with next EFL_SRCREV bump :), but then I've forgot to change
subject prefix.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Rex5+51txc1ort/q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5X5XUACgkQN1Ujt2V2gBxgzgCguV2au/8UJha+4fbEkHSbifJg
krEAnRgWMa2b/FkSgEha98AJwWF9+Lmu
=UBWF
-----END PGP SIGNATURE-----

--Rex5+51txc1ort/q--
