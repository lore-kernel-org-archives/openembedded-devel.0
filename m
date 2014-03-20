Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9FBE6EF8A;
	Thu, 20 Mar 2014 11:28:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2014 04:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,694,1389772800"; d="scan'208";a="502703734"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga002.fm.intel.com with ESMTP; 20 Mar 2014 04:28:49 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 20 Mar 2014 11:27:26 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.87]) by
	IRSMSX151.ger.corp.intel.com ([163.33.192.59]) with mapi id
	14.03.0123.003; Thu, 20 Mar 2014 11:27:26 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
Thread-Index: AQHPQt+8kmvwkEqcok24EBb8nrMl7prpi1+QgABEmwCAAAjZEA==
Date: Thu, 20 Mar 2014 11:27:25 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16D66FE6@IRSMSX105.ger.corp.intel.com>
References: <20140318191639.8B05350385@opal>
	<969F26A8BAB325438E7EB80D3C3134FB16D65A80@IRSMSX105.ger.corp.intel.com>
	<20140320105510.GC3726@jama>
In-Reply-To: <20140320105510.GC3726@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
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
X-List-Received-Date: Thu, 20 Mar 2014 11:28:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's ok in that case.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Thursday, March 20, 2014 12:55 PM
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe] [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9

On Thu, Mar 20, 2014 at 06:59:13AM +0000, Iorga, Cristian wrote:
> Hi Martin,
>=20
> Errr, what exactly is going on here?
> I have submitted this patch in a different form, with more content and mo=
re comments.

Stephen submitted upgrade from 0.18.4 to 0.18.8 before you and it was appli=
ed first.

So what was left from your patch after rebase was upgrade from 0.18.8 to 0.=
18.9.

If you don't agree I will merge just Stephen's patch and you can send new o=
ne after rebasing it yourself.

Thanks

> That's one thing.
> Another thing would be that even if you signed my patch in a modified for=
m, 5 minutes later, you signed another musicpd patch, going backwards from =
my version.
> Quote:
> " Module: meta-openembedded.git
> Branch: master-next
> Commit: dde222cef9bb8ef20d139ab58760b27c4d45c93a
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Ddde222cef9bb8ef20d139ab58760b27c4d45c93a
>=20
> Author: Stephen Arnold <stephen.arnold42@gmail.com>
> Date:   Sun Mar 16 17:52:47 2014 -0700
>=20
> musicpd/mpd: bump to current upstream stable
>=20
> Bump music player daemon to the latest upstream stable release.
> Same as previous 0.18.4 recipe with trivial updates.
>=20
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>"
>=20
> The only thing, let's say improved, from my patch to Stephen's patch  wou=
ld be the site URL.
>=20
> So which one is it?
> Still, yet, no patch got into the master, while I am stuck with a bug tha=
t I have not caused and, still, seems that I am responsible for it.
>=20
> Also, mpd v0.18.8 will still not fix the crash with libvorbis upgrade..
>=20
> I must say that from my point of view this is getting counterproductive..=
.
>=20
> Regards,
> Cristian Iorga
> YP
> Intel Corporation
>=20
>=20
> -----Original Message-----
> From: openembedded-commits-bounces@lists.openembedded.org=20
> [mailto:openembedded-commits-bounces@lists.openembedded.org] On Behalf=20
> Of git@git.openembedded.org
> Sent: Tuesday, March 18, 2014 9:17 PM
> To: openembedded-commits@lists.openembedded.org
> Subject: [oe-commits] Cristian Iorga : musicpd: upgrade to 0.18.9
>=20
> Module: meta-openembedded.git
> Branch: master-next
> Commit: 2e1305783023e6b0869e8ea12db25c53b803f545
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3D2e1305783023e6b0869e8ea12db25c53b803f545
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Mon Mar 17 11:05:17 2014 +0200
>=20
> musicpd: upgrade to 0.18.9
>=20
> * Upgrade fixes a crash with libvorbis 1.3.4;
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> ---
>=20
>  .../recipes-multimedia/musicpd/{mpd_0.18.8.bb =3D> mpd_0.18.9.bb}       =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb=20
> b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> similarity index 93%
> rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> index b6882af..c3bb581 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
> @@ -10,8 +10,8 @@ SRC_URI =3D " \
>      file://mpd.conf.in \
>  "
> =20
> -SRC_URI[md5sum] =3D "7bbe1caf5abe404dc985ca4f44984b1f"
> -SRC_URI[sha256sum] =3D "5366378e548fb77996cc33b0e15165ddd84f1e496bdd0461=
6bd593aecdc26450"
> +SRC_URI[md5sum] =3D "0e5156a831d4302d2032998bcfd5c36f"
> +SRC_URI[sha256sum] =3D "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be534=
6f19de5f699a68de"
> =20
>  inherit autotools useradd systemd
> =20
>=20
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

