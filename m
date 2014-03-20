Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11AD76EFFF;
	Thu, 20 Mar 2014 10:55:09 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so504433eek.11
	for <multiple recipients>; Thu, 20 Mar 2014 03:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DLySand2y3V/0FBecDuT8ka2Z5ChRbwUx4Z70BiZfzU=;
	b=NDbODi4kkaRE6vvObZ+r19+ceIsCWAgQSXk4GL/FPdQNOMdhpLVmKWtwHkeUiZeLtz
	40re03di6mRXljMUSN1uuf9AdnDeEMDNwOPykq6XDj4T6SNjEKFTrOF8UFmoMT6P2Pfy
	35Q+uowttqu+/PXp52VQx9tlMcofvZOh5cI/sJe06IhbXi2Ga4Zm2Izh8XwCzM2mhKGr
	EHPuhrMvEn/kuYuUmjPNz5bl3uIzjXXMaAb1gdigJmGQPlHUiPAsQq4tAdl47SyWeDIX
	VItqPp1JU9+q40m7EZJTCXMJyXG1eU/H3wIsCETtbGhli2ftmxo4eZf7S7CRtSzRVCaO
	I1NA==
X-Received: by 10.14.219.137 with SMTP id m9mr26065590eep.77.1395312910305;
	Thu, 20 Mar 2014 03:55:10 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z47sm3412370een.16.2014.03.20.03.55.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 03:55:09 -0700 (PDT)
Date: Thu, 20 Mar 2014 11:55:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140320105510.GC3726@jama>
References: <20140318191639.8B05350385@opal>
	<969F26A8BAB325438E7EB80D3C3134FB16D65A80@IRSMSX105.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16D65A80@IRSMSX105.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Thu, 20 Mar 2014 10:55:10 -0000
X-Groupsio-MsgNum: 48770
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline

--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2014 at 06:59:13AM +0000, Iorga, Cristian wrote:
> Hi Martin,
>=20
> Errr, what exactly is going on here?
> I have submitted this patch in a different form, with more content and mo=
re comments.

Stephen submitted upgrade from 0.18.4 to 0.18.8 before you and it was appli=
ed first.

So what was left from your patch after rebase was upgrade from 0.18.8 to
0.18.9.

If you don't agree I will merge just Stephen's patch and you can send
new one after rebasing it yourself.

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
> I must say that from my point of view this is getting counterproductive...
>=20
> Regards,
> Cristian Iorga
> YP
> Intel Corporation
>=20
>=20
> -----Original Message-----
> From: openembedded-commits-bounces@lists.openembedded.org [mailto:openemb=
edded-commits-bounces@lists.openembedded.org] On Behalf Of git@git.openembe=
dded.org
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
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.8.bb b/m=
eta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
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
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMqyQ4ACgkQN1Ujt2V2gBzAMgCdHVcinHWdWdqrYPNJAmHzhZAq
LVAAniXq2m4bIB66vuZMkZKhJPck3ZWG
=rHP/
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
