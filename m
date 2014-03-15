Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id CDF2C6F88B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:27:28 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so2495877eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 08:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bfyPQCFq3Hcs/cYrMi+GUbUzVVMS+RHH+5GHBdfnAns=;
	b=i3wGzoPQx5cUbKFWAOrxMuSqAuiNKP5GGx39ZxCXFE5mxk//mCsccdKnGMLWmbzeGo
	MsnkqxGmR1mDfekBbQPdkXc997rSamFJeTf1kpILoSH7VP134Dj1I8rjimXS4gwBcjsG
	W4/A9bl7LQZnpeU4JiVRlOPbz5jGQUXXDAegnIgDIoOrf9+RBydKvu9DyN1a1XzKi7Tc
	PSKwmEV7wuGoEcnHaozZ40zzYBJIo4Yk/Q21XKNugfaIkd0SDxtwMBA1KTFIFNUs21zN
	RHplwh0/xyhHLnW+PtHuZV89f4pajiT9tJ7Ksfbjy43uO3QDwv8TvYoevxBRajJJ8Rcz
	mI3w==
X-Received: by 10.15.56.130 with SMTP id y2mr14634069eew.17.1394897248962;
	Sat, 15 Mar 2014 08:27:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z48sm13079342eel.27.2014.03.15.08.27.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 08:27:27 -0700 (PDT)
Date: Sat, 15 Mar 2014 16:27:44 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140315152744.GL3759@jama>
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
	<64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
	<20140315152003.GK3759@jama>
	<2D16971D-4F6B-4162-8CD6-E28C34160B11@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2D16971D-4F6B-4162-8CD6-E28C34160B11@gmail.com>
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
X-List-Received-Date: Sat, 15 Mar 2014 15:27:30 -0000
X-Groupsio-MsgNum: 48698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xtmLDbP6TiKhntQb"
Content-Disposition: inline

--xtmLDbP6TiKhntQb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 08:22:33AM -0700, Khem Raj wrote:
>=20
> On Mar 15, 2014, at 8:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Sat, Mar 15, 2014 at 08:04:14AM -0700, Khem Raj wrote:
> >>=20
> >> On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:
> >>=20
> >>> The license agreement doesn't mention Nokia anymore after Qt was
> >>> acquired by Digia.
> >>>=20
> >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>> ---
> >>> licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
> >>> recipes-qt/qt5/qt3d.inc                     | 2 +-
> >>> 2 files changed, 1 insertion(+), 1 deletion(-)
> >>> rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
> >>>=20
> >>> diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
> >>> similarity index 100%
> >>> rename from licenses/NOKIA-TPLA-2.4
> >>> rename to licenses/DIGIA-TPLA-2.4
> >>> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
> >>> index 78b9ecc..74c4cad 100644
> >>> --- a/recipes-qt/qt5/qt3d.inc
> >>> +++ b/recipes-qt/qt5/qt3d.inc
> >>> @@ -2,7 +2,7 @@ require qt5.inc
> >>>=20
> >>> DEPENDS +=3D "qtdeclarative"
> >>>=20
> >>> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
> >>> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=E2=80=9D
> >>=20
> >> you need to rename the license file too
> >=20
> > he did :)
> >=20
> > sorry it's my mistake, when I was updating license text from newer qt3d
> > repo I haven't noticed nokia->digia change between whitespace changes
> >=20
> > should we use the same text for dylan,dora,master even when older qt3d
> > revisions have older text? I think it would be better to have
> > DIGIA-TPLA-2.4 everywhere.
>=20
>=20
> I think call it QT-TPLA-2.4 and then the name becomes universal

name yes, but still the text would be different in qt3d repo and our
text before this qt3d commit which changed it to digia:
https://qt.gitorious.org/qt/qt3d/commit/06eb6c1060743b7dbd61bfa9a169f2a1cd4=
4af39#LICENSE.PREVIEW.COMMERCIAL

alternatively we can keep both texts (remove my update of license text
=66rom NOKIA-TPLA-2.4 and keep separate DIGIA-TPLA-2.4 and use the right
one based on SRCREV used in recipe.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xtmLDbP6TiKhntQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMkcXAACgkQN1Ujt2V2gBxrYgCglYVyY+oKsDhRFbRLvMalZszl
GWcAoK+jDGUx4gzbD2MRFfkLYnkP1PxW
=qXYw
-----END PGP SIGNATURE-----

--xtmLDbP6TiKhntQb--
