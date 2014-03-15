Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 429836F889
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:19:49 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so2395093eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 08:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gkfRE2PzCJymqtZ/hSBtqVCBJJw56Z2GQhj58HSQTgg=;
	b=KalS49HivUQPkshTPt4B9CRAfZ8ecGufXv9dO7HAQAuSsZArsssNbH8wSMC7JkPDD5
	Xbqrnzdig5iRRNT0yOD4sdEMZakkWWQUbGYotNkuzxDEHDW5K+3FiC6c4OYNo1Dt8wB5
	plMM+jaHOk3Q2ss5gVZF2rD9h6c4huIpAXFmEcWIohit5ZI4oaTLGKog8VC1ruyQ5X8m
	XH0lPtcGqBIweGWFBKLI1KntRY67js4giR5TR25QVIBHJc0pT2K+PdIgSP52khHgvpSO
	SLqN7+iYGmG50fXQ9152HpBVf2PaI0QwxWwzt83qDh4DtgnP0x4HL0H6s15w8Ph6kdM2
	Zp5A==
X-Received: by 10.14.214.2 with SMTP id b2mr14515777eep.20.1394896789793;
	Sat, 15 Mar 2014 08:19:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm13036283eel.27.2014.03.15.08.19.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 08:19:47 -0700 (PDT)
Date: Sat, 15 Mar 2014 16:20:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140315152003.GK3759@jama>
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
	<64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
MIME-Version: 1.0
In-Reply-To: <64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] licenses: rename NOKIA-TPLA-2.4 to DIGIA-TPLA-2.4
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
X-List-Received-Date: Sat, 15 Mar 2014 15:19:54 -0000
X-Groupsio-MsgNum: 48696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EMQjp+MvU6EBGjHc"
Content-Disposition: inline

--EMQjp+MvU6EBGjHc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 08:04:14AM -0700, Khem Raj wrote:
>=20
> On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:
>=20
> > The license agreement doesn't mention Nokia anymore after Qt was
> > acquired by Digia.
> >=20
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > ---
> > licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
> > recipes-qt/qt5/qt3d.inc                     | 2 +-
> > 2 files changed, 1 insertion(+), 1 deletion(-)
> > rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
> >=20
> > diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
> > similarity index 100%
> > rename from licenses/NOKIA-TPLA-2.4
> > rename to licenses/DIGIA-TPLA-2.4
> > diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
> > index 78b9ecc..74c4cad 100644
> > --- a/recipes-qt/qt5/qt3d.inc
> > +++ b/recipes-qt/qt5/qt3d.inc
> > @@ -2,7 +2,7 @@ require qt5.inc
> >=20
> > DEPENDS +=3D "qtdeclarative"
> >=20
> > -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
> > +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=E2=80=9D
>=20
> you need to rename the license file too

he did :)

sorry it's my mistake, when I was updating license text from newer qt3d
repo I haven't noticed nokia->digia change between whitespace changes

should we use the same text for dylan,dora,master even when older qt3d
revisions have older text? I think it would be better to have
DIGIA-TPLA-2.4 everywhere.

> > LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1=
ee66161de \
> >                     file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2=
c139dfb268fb6 \
> >                     file://LICENSE.PREVIEW.COMMERCIAL;md5=3D9d94dadfab8=
b246782ffea02082ee13a \
> > --=20
> > 1.9.0
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EMQjp+MvU6EBGjHc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMkb6MACgkQN1Ujt2V2gBxp5wCfUwIhu28L5mTtHWr9T/wQnG09
bFQAn3wZav79DUYmrVb/+cX957kE+PWp
=OWp6
-----END PGP SIGNATURE-----

--EMQjp+MvU6EBGjHc--
