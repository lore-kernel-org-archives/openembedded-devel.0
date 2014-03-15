Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC276F895
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:04:16 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so3854174pbc.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 08:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=vTzmpEHu3gzfxA8k50696Ct9kcr9RNhxexRVGI/5KD0=;
	b=FVgTgHXq+vwis5twUShXsYwnbkYkkf97PpG5YFf0N94r7UeT1T+vzo77dhM+WnaEBs
	v0B2aOwcGWU1kMpExXZcjcqE5LoAmFlu4FXsng4O3ymGxXMm7AvaMalfpr/aN68HLRtW
	31J1X0VNy3SJx4HnbjwYvAY0V0WmKlr/VQmy0Ur+2Z6+v4+m3JNasJjMbdnfEbjPo9QH
	usNbjKbUv0TTQ9FQZl/Ks6l4aMQvGKv9t87zD7/oochTkPKjd4hOOAJG7qs6gHFDWNP4
	avcO0gE4vpxd97gVpYD2YHh5c+1gyjijnMNW9OTeiJ7ZY+M/hbp2trE7nyK4/+J30yfM
	LC/w==
X-Received: by 10.68.105.36 with SMTP id gj4mr15603142pbb.64.1394895857725;
	Sat, 15 Mar 2014 08:04:17 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	rk15sm42806271pab.37.2014.03.15.08.04.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 08:04:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <64904C75-41B7-43D4-9ED0-16AB64F12285@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Date: Sat, 15 Mar 2014 08:04:14 -0700
References: <1394895279-7276-1-git-send-email-net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1394895279-7276-1-git-send-email-net147@gmail.com>
X-Mailer: Apple Mail (2.1874)
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
X-List-Received-Date: Sat, 15 Mar 2014 15:04:18 -0000
X-Groupsio-MsgNum: 48695
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B87B9E33-D42C-4716-B984-1FBC95293129";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B87B9E33-D42C-4716-B984-1FBC95293129
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 15, 2014, at 7:54 AM, Jonathan Liu <net147@gmail.com> wrote:

> The license agreement doesn't mention Nokia anymore after Qt was
> acquired by Digia.
>=20
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
> licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} | 0
> recipes-qt/qt5/qt3d.inc                     | 2 +-
> 2 files changed, 1 insertion(+), 1 deletion(-)
> rename licenses/{NOKIA-TPLA-2.4 =3D> DIGIA-TPLA-2.4} (100%)
>=20
> diff --git a/licenses/NOKIA-TPLA-2.4 b/licenses/DIGIA-TPLA-2.4
> similarity index 100%
> rename from licenses/NOKIA-TPLA-2.4
> rename to licenses/DIGIA-TPLA-2.4
> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
> index 78b9ecc..74c4cad 100644
> --- a/recipes-qt/qt5/qt3d.inc
> +++ b/recipes-qt/qt5/qt3d.inc
> @@ -2,7 +2,7 @@ require qt5.inc
>=20
> DEPENDS +=3D "qtdeclarative"
>=20
> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & DIGIA-TPLA-2.4 | GPL-3.0=94

you need to rename the license file too

> LIC_FILES_CHKSUM =3D =
"file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1ee66161de \
>                     =
file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c139dfb268fb6 \
>                     =
file://LICENSE.PREVIEW.COMMERCIAL;md5=3D9d94dadfab8b246782ffea02082ee13a =
\
> --=20
> 1.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B87B9E33-D42C-4716-B984-1FBC95293129
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMka+8ACgkQuwUzVZGdMxTlhgCgiryd4/Y4bq/RH+4OQoYghOgo
/CsAoIhQ9EWk3IB0PMpxt53bH1y7WddY
=Bx7B
-----END PGP SIGNATURE-----

--Apple-Mail=_B87B9E33-D42C-4716-B984-1FBC95293129--
