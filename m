Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1TLxuC-0001QF-3V
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 17:09:04 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so606342pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2012 07:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=NzkhB7QOTVydENYarBHrSHwypAO1l0F19PcRyD9z1pQ=;
	b=XCbvAohkYb+xEf3qjOQ9gV+lPhHytSEX/M4yIrdOmFZBg5i3GBVnJKe9D8rlpaB9eI
	Zt1SUF6RfDU86ylMVbdxXQT7ZK92A0Nl3PQOdKSo+RaKoJZROCGY6Rupqsg+H1LT2pMr
	h5gcqYreRq89BvTnJbzJtdZNGWA1fq2/defcfIIawrq3Xs7J1yXnDwyxrflZrY+aIWAG
	6iipnVWCEaBawmzUExn4qyQhRMfb9+VJrGmbcbOGVouiGwax3hzfnSB3xjD1xgTa4TgU
	Y4OUIIFjgcvcvk18SO+rMne1j/0LO0KvgSp5TZ0AnJwvhoUrd9K0ZX1crYfvHbywLTMU
	L2mQ==
Received: by 10.68.222.231 with SMTP id qp7mr74019255pbc.7.1349880954457;
	Wed, 10 Oct 2012 07:55:54 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:a4bf:d51f:ab5e:2eb6])
	by mx.google.com with ESMTPS id nd6sm1131124pbc.68.2012.10.10.07.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 07:55:52 -0700 (PDT)
Date: Wed, 10 Oct 2012 07:55:59 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20121010145559.GM1137@bill-the-cat>
References: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
	<cover.1349772344.git.sledz@dresearch-fe.de>
	<20121009144235.GD16530@bill-the-cat>
	<507518B0.4040504@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <507518B0.4040504@dresearch-fe.de>
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
X-List-Received-Date: Wed, 10 Oct 2012 15:09:04 -0000
X-Groupsio-MsgNum: 41042
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Content-Disposition: inline

--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 10, 2012 at 08:41:52AM +0200, Steffen Sledz wrote:
> On 09.10.2012 16:42, Tom Rini wrote:
> > On Tue, Oct 09, 2012 at 10:49:06AM +0200, Steffen Sledz wrote:
> >=20
> >> Hi Tom,
> >>=20
> >> please pull this commit which fixes a build problem on build hosts wit=
h newer libXrender installations.
> >>=20
> >> Thx, Steffen
> >>=20
> >> The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2a=
d47fb:
> >>=20
> >> gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)
> >>=20
> >> are available in the git repository at:
> >>=20
> >> git://github.com/sledz/oe pull-request-3 https://github.com/sledz/oe/t=
ree/pull-request-3
> >>=20
> >> Steffen Sledz (1): pango-native: add libxrender-native to dependencies
> >>=20
> >> recipes/pango/pango.inc |    4 ++-- 1 file changed, 2 insertions(+), 2=
 deletions(-)
> >=20
> > Applied to 2011.03-maintenance, thanks!
>=20
> Something went wrong. The patch isn't in the 2011.03-maintenance branch. =
:(

OK, now it's pushed there too, sorry about that.

--=20
Tom

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlB1jH8ACgkQdZngf2G4WwMj1gCfRT7a9EMa9aKc4mu3olyWbEQM
KMMAoIgh8IdD4FMZAJuGL9OoCPw1ED4b
=MCvr
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
