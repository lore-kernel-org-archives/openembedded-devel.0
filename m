Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id ECAE176497
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:55:44 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so32125293wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/+R3tRLhY+wfaniWGh9KqVzuRE4Av10ZPL+VRsN175I=;
	b=vtLUvS7pL7Jo9fbaMXW2RkxHihdOuuit5fzIrj3xYEbmPVHGz/MqoDTDU8UCuUHWUm
	UyOdONlekAdd1+7eFHliSoM1hsuZFLmbxdVJ0IagCGZPlMjdYcKEeNiIxlZrUt/fZ3vt
	vKTZq844xU9dnFVZ9yaAM5h4DVTaxERgG+I88PmSwYIVaEl89PVuFf++McGBjy2IJH+V
	uW10FiTIg7Z9EV80BDzRz8vtmscRyTrhwUyteaWSgQnS/TU3K/1vOHIymvLEpaFFQWJL
	r0sCgsRAEJcMuruEqNSXXlXIc5IzJ56074sDa3JghrqW3f4aYRyAgmR7uXrpFeGiRnTK
	vvTQ==
X-Received: by 10.180.75.243 with SMTP id f19mr9040968wiw.52.1438282544417;
	Thu, 30 Jul 2015 11:55:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ho10sm3191615wjb.39.2015.07.30.11.55.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 11:55:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 20:55:59 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150730185559.GQ2457@jama>
References: <1437591250-9247-1-git-send-email-jslater@windriver.com>
	<20150722203127.GM22729@mentor.com>
	<007BD92917A2324FA403BCF9A464CF848235F768@ALA-MBA.corp.ad.wrs.com>
	<20150730154112.GC6457@mentor.com>
	<007BD92917A2324FA403BCF9A464CF848236386B@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <007BD92917A2324FA403BCF9A464CF848236386B@ALA-MBA.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH 1/1] ypbind-mt: add dependency but keep as broken
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jul 2015 18:55:46 -0000
X-Groupsio-MsgNum: 56446
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K9fy5ol1Oes4Q/ix"
Content-Disposition: inline

--K9fy5ol1Oes4Q/ix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 06:19:10PM +0000, Slater, Joseph wrote:
>=20
>=20
> > -----Original Message-----
> > From: Joe MacDonald [mailto:Joe_MacDonald@mentor.com]
> > Sent: Thursday, July 30, 2015 8:41 AM
> > To: Slater, Joseph
> > Cc: openembedded-devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependenc=
y but keep as
> > broken
> >=20
> > [Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but ke=
ep as broken] On
> > 15.07.28 (Tue 19:39) Slater, Joseph wrote:
> >=20
> > >
> > > > -----Original Message-----
> > > > From: openembedded-devel-bounces@lists.openembedded.org [mailto:ope=
nembedded-devel-
> > > > bounces@lists.openembedded.org] On Behalf Of Joe MacDonald
> > > > Sent: Wednesday, July 22, 2015 1:31 PM
> > > > To: openembedded-devel@lists.openembedded.org
> > > > Subject: Re: [oe] [meta-networking][PATCH 1/1] ypbind-mt: add depen=
dency but keep as
> > > > broken
> > > >
> > > > [[oe] [meta-networking][PATCH 1/1] ypbind-mt: add dependency but ke=
ep as broken] On
> > > > 15.07.22 (Wed 11:54) Joe Slater wrote:
> > > >
> > > > > We will need the conditional dependency on systemd.  It is
> > > > > not a good idea to use PNBLACKLIST in a recipe, and the
> > > >
> > > > It isn't a good idea to have a recipe that needs to be blacklisted.=
  :-)
> > > >
> > > > That said, it's here and there's still an argument for supporting i=
t, so
> > > > why remove PNBLACKLIST and replace it with something less obvious?
> > >
> > > Blacklisting oneself is esthetically unpleasing.
> >=20
> > I won't argue there.  But it happens because it's a less violent option
> > than kicking the recipe to the curb and waiting for pick-up day.  It
> > does allow someone using the recipe to come along and still use it for
> > their scenario if they need it and they know the reason for the
> > blacklisting doesn't apply to them.
> >=20
> > > But, beyond that, it doesn't work for multilib variants, and for some
> > > reason PNBLACKLIST[${PN}] does not parse.
> >=20
> > I don't know about that, but maybe a patch to poky is appropriate
> > instead.  It's nothing to be proud of, but there are dozens of recipes
> > in meta-openembedded/ right now that are blacklisted, unless you're
> > planning on submitting the same construct to replace all of them, I
> > don't think there's much more to discuss on it.
> >=20
> > I'm marking this 'changes requested'.  Do you think you could re-submit
> > with just the dependency change?
>=20
> Sure.  I'll check, though, if maybe PNBLACKLIST["${PN}"] parses, in which
> case I'll use that for the blacklisting.

I still don't see any reason to change "PNBLACKLIST[ypbind-mt]".

> Joe
>=20
> >=20
> > Thanks,
> > -J.
> >=20
> > >
> > > Joe
> > >
> > >
> > > >
> > > > No objection to a conditional dependency on systemd.
> > > >
> > > > -J.
> > > >
> > > > > version here does not suppress lib32-ypbind-mt.
> > > > >
> > > > > Signed-off-by: Joe Slater <jslater@windriver.com>
> > > > > ---
> > > > >  recipes-support/nis/ypbind-mt_2.2.bb |    6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb=
 b/meta-
> > > > networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > > > index 4f8bf48..359b020 100644
> > > > > --- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > > > +++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> > > > > @@ -15,10 +15,12 @@ of known secure NIS server (/etc/yp.conf) Bin=
ds to \
> > > > >  the server which answered as first. \
> > > > >  "
> > > > >  HOMEPAGE =3D "http://www.linux-nis.org/nis/ypbind-mt/index.html"
> > > > > -DEPENDS =3D "yp-tools"
> > > > > +DEPENDS =3D "yp-tools ${@base_contains('DISTRO_FEATURES', 'syste=
md', 'systemd', '',
> > d)}"
> > > > >  PROVIDES +=3D "ypbind"
> > > > >
> > > > > -PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broken yp-tools"
> > > > > +python () {
> > > > > +    raise bb.parse.SkipPackage("BROKEN: Depends on broken yp-too=
ls")
> > > > > +}
> > > > >
> > > > >  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.t=
ar.bz2 \
> > > > >             file://ypbind-yocto.init \
> > > > > --
> > > > > 1.7.9.5
> > > > >
> > > > --
> > > > -Joe MacDonald.
> > > > :wq
> > --
> > -Joe MacDonald.
> > :wq
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K9fy5ol1Oes4Q/ix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6cz4ACgkQN1Ujt2V2gByelwCcCW4/2s5vK6XPgzJ05AUHY6Gr
BpcAn3zhW1tZCtxllPLD2Ygz79oCJQHo
=xN1v
-----END PGP SIGNATURE-----

--K9fy5ol1Oes4Q/ix--
