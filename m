Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 888E273A68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 16:39:40 +0000 (UTC)
Received: by wghk14 with SMTP id k14so3155052wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cMhKfNzDG7CRsUc0OQ+5YVjggCvCbnhstZQystAYUMU=;
	b=Ye3JzC6n/RvSMOpVKbfkDaQmNvPq3yfmbBciDtz0OXxAcWgtxY5N5J9GIRtPKopKH4
	lMNncp58EVwNJACunUWQrTlx6ZuwiMxPYFPzADHkTn1B4j4gP5RhfksQ3jsYXSxwHOwv
	/IbDvtiNkMgqljDr5jF+lT5AWtcuUumrKqsBHHwouYwKe+ry/xg+ZBKyTjE79qx/s1J5
	BLOh06iRlycTFjwKGPKupI6i4skv8T390AamOtFYNXzNYozmGL/IwlxFOjKfeQX2vhg9
	KYiFcWvziY+y+Tj4uXhjcyLZBPLi2BZFUcoW45zGO+in52bswqJ570a5UkrwvOXaKxuU
	Z7pw==
X-Received: by 10.180.82.129 with SMTP id i1mr70684658wiy.77.1426005581014;
	Tue, 10 Mar 2015 09:39:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g5sm1629164wjr.19.2015.03.10.09.39.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Mar 2015 09:39:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Mar 2015 17:40:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150310164011.GE2340@jama>
References: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
	<CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
	<5940D1D9F240BA44AEF939055CF1358D05983328@xmb-aln-x12.cisco.com>
	<CAL5ScNUOLrvKqKerezbgBrNmgHuvQr-b6ZrARU9wHqBa+43NiQ@mail.gmail.com>
	<CAL5ScNVr2nWU-M-9EsGT0Hhd++t=b16u4kS=TgLia2hunrS+5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL5ScNVr2nWU-M-9EsGT0Hhd++t=b16u4kS=TgLia2hunrS+5A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use https protocol for gitorious
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
X-List-Received-Date: Tue, 10 Mar 2015 16:39:40 -0000
X-Groupsio-MsgNum: 54715
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline

--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 02:53:30PM +0100, Frederico Cadete wrote:
> The following changes since commit 936d70288fd30f4df42bc382fec886a6495ef5=
82:
>=20
>   qtwebengine: Fix build with accessibility enabled (2015-03-06 11:04:22 =
+0100)
>=20
> are available in the git repository at:
>=20
>   https://github.com/fredcadete/meta-qt5 master
>=20
> for you to fetch changes up to 06cb6a48d52b8e2eefb53ccdf616a24ffa58df6e:
>=20
>   qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
> (2015-03-09 14:51:39 +0100)
>=20
> ----------------------------------------------------------------
> Frederico Cadete (1):
>       qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
>=20
>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
>  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
>  recipes-qt/qt5/qt5-git.inc                   | 2 +-
>  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
>  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> On Mon, Mar 9, 2015 at 2:50 PM, Frederico Cadete <frederico@cadete.eu> wr=
ote:
> > On Mon, Mar 9, 2015 at 2:01 PM, Julien Brianceau (jbriance)
> > <jbriance@cisco.com> wrote:
> >> Wouldn't be better to move to http://code.qt.io/ ? This is the new pla=
ce where Qt repositories are hosted, and it supports git:// protocol.
> >>
> >> Julien
> >>
> >
> > That sounds good and is working on my side.
> >
> > The remaining question is qt5everywheredemo. It has
> >  HOMEPAGE =3D "https://qt.gitorious.org/qt-labs"
> >
> > This will have to change soon, but I don't know to where.
> >
> > Sorry for the "invisible" patch, the mailing list blocked it while I
> > was not a subscriber.
> > I will follow up with a PR.

Can you resend the patch with switch to code.qt.io? I don't see it on ML
and in patchwork.

Thanks,

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT/HmsACgkQN1Ujt2V2gByhMACfX0aOMiwmDgJJOkPCHPl2HztT
I2MAn0FfmiqjjDN8M+mgeKgYOoFt0kid
=jA5d
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
