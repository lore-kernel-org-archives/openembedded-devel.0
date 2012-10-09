Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TLbDe-0006GF-Vx
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 16:55:39 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so4775885pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=jaE84PM2YrWwX1CSrdWIyr7P9q1BxU1jiD5ArLkS6Zk=;
	b=0OGo2USDDqEQ3LM0C4jrfKnfkiWKaAHhXzWPtD5nCdRzTjhhZv/IFEgjYyuLG7d7Vz
	fhXfeTyeDqAgRUghB+QfzAAdj9SA62rHR0N1DGm+ENgYH0D7OnWCGgbZxtlYWxnPhKex
	TjbmTeoYJaUk1nUq22oun7atyBJglF2TtSSTCEb8Dw7Xk1cOcdrByTAhGzuiUsAxoOuq
	JQyNBKpUPgUIj3Mol6kv2l2vyVwYdMUL3CsBi0ufKSa/2lYIn+l0MFh2B99wJksNEs72
	qUZNl4NJn0GFTUMUnWv4Ha/4ORA7WV8hABiB3YThj5gy7k6SXLTz6XdKgbNO1KOrJefv
	woCg==
Received: by 10.66.72.197 with SMTP id f5mr53318580pav.20.1349793750769;
	Tue, 09 Oct 2012 07:42:30 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:d921:cb9:5b45:279c])
	by mx.google.com with ESMTPS id po4sm12502367pbb.13.2012.10.09.07.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 07:42:29 -0700 (PDT)
Date: Tue, 9 Oct 2012 07:42:35 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20121009144235.GD16530@bill-the-cat>
References: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
	<cover.1349772344.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1349772344.git.sledz@dresearch-fe.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20121009
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
X-List-Received-Date: Tue, 09 Oct 2012 14:55:39 -0000
X-Groupsio-MsgNum: 41028
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Content-Disposition: inline

--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 09, 2012 at 10:49:06AM +0200, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull this commit which fixes a build problem on build hosts
> with newer libXrender installations.
>=20
> Thx,
> Steffen
>=20
> The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47=
fb:
>=20
>   gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)
>=20
> are available in the git repository at:
>=20
>   git://github.com/sledz/oe pull-request-3
>   https://github.com/sledz/oe/tree/pull-request-3
>=20
> Steffen Sledz (1):
>   pango-native: add libxrender-native to dependencies
>=20
>  recipes/pango/pango.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to 2011.03-maintenance, thanks!

--=20
Tom

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlB0N9sACgkQdZngf2G4WwOLygCePPAa7cK9sqdAR8wxxY+tWgTW
h24AoIKrL6J3XIvMy/gk/w71L5DNohN/
=njMB
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
