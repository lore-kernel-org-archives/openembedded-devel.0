Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id C31006C735
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 18:02:57 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2575017eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 11:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yxjjgDZQWUx46qAcO7UiwXcRw4/Gm3zyKQHv8p26HMo=;
	b=uD1jtQdrDwT7FI/99YlHy8bGNtD6wPrBL2WjVm34mmwGkNbu+a/4j/wWgkS4kvxUhq
	2IdMmEXEuER8EevfAeEN1eYRlVvAjibRiAu6GKjLgKM0PHqtyoZwgdrFLtojnaktlAZ3
	MWaqi81LjlqvuGg+VhOCsHInBC/X+mno8Yjw4sSNUziZ8+to1cMR97B3b139hDgJiVH1
	7I7RL07ky3uefImIGNNhmM168WMTKH0rbFkGm9LIyot6BYbZms5PCYBnfomohJDzdZba
	yPqq1LA9/RYTjj+hX8vGaMc1X255N7S/ItkVjc7vyazreVjJkPtfugIu1CqganyBm2dE
	f45w==
X-Received: by 10.14.203.5 with SMTP id e5mr75678eeo.105.1394906577240;
	Sat, 15 Mar 2014 11:02:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g3sm13969159eet.35.2014.03.15.11.02.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 11:02:55 -0700 (PDT)
Date: Sat, 15 Mar 2014 19:03:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140315180311.GN3759@jama>
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
	<64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
	<20140315152003.GK3759@jama>
	<2D16971D-4F6B-4162-8CD6-E28C34160B11@gmail.com>
	<20140315152744.GL3759@jama>
	<CAMKF1soRTANjW7rnHkAQJjEDEeWQsT_LDJjgMLXBGypepjMuqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soRTANjW7rnHkAQJjEDEeWQsT_LDJjgMLXBGypepjMuqA@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Mar 2014 18:03:01 -0000
X-Groupsio-MsgNum: 48701
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y4VYWfdFdHwFhC6D"
Content-Disposition: inline

--Y4VYWfdFdHwFhC6D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 15, 2014 at 08:55:30AM -0700, Khem Raj wrote:
> On Sat, Mar 15, 2014 at 8:27 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Sat, Mar 15, 2014 at 08:22:33AM -0700, Khem Raj wrote:
> >>
> >> On Mar 15, 2014, at 8:20 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> >>
> >> > On Sat, Mar 15, 2014 at 08:04:14AM -0700, Khem Raj wrote:
> >> >>
> >> >> On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:
> >> >>
> >> >>> The license agreement doesn't mention Nokia anymore after Qt was
> >> >>> acquired by Digia.
> >> >>>
> >> >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> >>> ---
> >> >>> licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
> >> >>> recipes-qt/qt5/qt3d.inc                     | 2 +-
> >> >>> 2 files changed, 1 insertion(+), 1 deletion(-)
> >> >>> rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
> >> >>>
> >> >>> diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
> >> >>> similarity index 100%
> >> >>> rename from licenses/NOKIA-TPLA-2.4
> >> >>> rename to licenses/DIGIA-TPLA-2.4
> >> >>> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
> >> >>> index 78b9ecc..74c4cad 100644
> >> >>> --- a/recipes-qt/qt5/qt3d.inc
> >> >>> +++ b/recipes-qt/qt5/qt3d.inc
> >> >>> @@ -2,7 +2,7 @@ require qt5.inc
> >> >>>
> >> >>> DEPENDS +=3D "qtdeclarative"
> >> >>>
> >> >>> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
> >> >>> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=E2=80=
=9D
> >> >>
> >> >> you need to rename the license file too
> >> >
> >> > he did :)
> >> >
> >> > sorry it's my mistake, when I was updating license text from newer q=
t3d
> >> > repo I haven't noticed nokia->digia change between whitespace changes
> >> >
> >> > should we use the same text for dylan,dora,master even when older qt=
3d
> >> > revisions have older text? I think it would be better to have
> >> > DIGIA-TPLA-2.4 everywhere.
> >>
> >>
> >> I think call it QT-TPLA-2.4 and then the name becomes universal
> >
> > name yes, but still the text would be different in qt3d repo and our
> > text before this qt3d commit which changed it to digia:
> > https://qt.gitorious.org/qt/qt3d/commit/06eb6c1060743b7dbd61bfa9a169f2a=
1cd44af39#LICENSE.PREVIEW.COMMERCIAL
> >
> > alternatively we can keep both texts (remove my update of license text
> > from NOKIA-TPLA-2.4 and keep separate DIGIA-TPLA-2.4 and use the right
> > one based on SRCREV used in recipe.
>=20
> yeh probably have 2 copied is better

Sorry for noise and confusion, I've double-checked and even old SRCREV
in meta-qt5/dylan already has this commit, so I've just merged the
rename to all branches.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y4VYWfdFdHwFhC6D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMkld8ACgkQN1Ujt2V2gByhFwCbBuRHJ6yL3lRUMImGRbudgs5J
KUAAoLXZXAHAj3LtekaVKymR1Zmj3EZT
=vYWf
-----END PGP SIGNATURE-----

--Y4VYWfdFdHwFhC6D--
