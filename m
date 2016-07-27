Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8E49606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 12:55:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so6349147wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6/I6AZoQsSaBXW97RQARTK9mF77HEhtn+6djJ+TZcW8=;
	b=lBo0ljO0FlObbZ3OUwzLBFt3JlUzWKABk5YvLrakJxXbEtr5ntY1WJr2lMYLScMtcG
	5dcmxRePXmeOqnbHPP5UEF6R4dxGid47FH00Nth+KlPs6C5N9JGseQbSL6Oa6Z9b4GTL
	Q7LTTef+gh0HDFBXb1vitxd6ceTzd9SneBxaH387fTkrvYcD+HKyxtIc493Z0+e/jtbN
	aPU8Ku47IYY7XWaPzn8komCZNWFW9q7ti6QXkIAJoF2tpG1NeioakUsaH4uskz0q58Pb
	ffE1YXaU+yZH5wxKLDFQuIjCS8lDlJDqiv3FicnQGKPvuLpId3Gkjuws88hDdqNjarul
	mcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6/I6AZoQsSaBXW97RQARTK9mF77HEhtn+6djJ+TZcW8=;
	b=Ld54eBwk/FL/ujR+/96veELB1Yj672of05Fv+8SG/iOLo+mev3d7OQWbDDEGNkf1II
	bTxf+DZOmmkno8nGX7DeahNc27wjCPI8tAm9zUor1gVM8hWR9bNDYQ969kSxKF9xDfv6
	SSpkCfwt/BXklCQ7/CT1XY0JF7efcikiE34WHHUVgEfmD7FrXF88qOtrbcGvGyKZznQP
	i6DzZuMadvrHLlVizYnAQKDUHkhowKKXeqHZhZybl5EDBiVdWdxlThbxYEkEugHvSVuL
	brBLQfXairm/WsLkXv5+ATQ21iJHU4qFv587Slhf2Zb/9oCdUgHcNo5yIiaCYjyoHpLZ
	Jh6w==
X-Gm-Message-State: AEkoouuA9hCpk1+kJCyfEgEB37rvCapuiyzuW2iWvFrMACIX7VECgdMjTfjhqNHAst80KA==
X-Received: by 10.194.39.3 with SMTP id l3mr31050610wjk.133.1469624137625;
	Wed, 27 Jul 2016 05:55:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm6232569wjc.49.2016.07.27.05.55.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jul 2016 05:55:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 27 Jul 2016 14:55:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160727125539.5p7zs2kaxf2nxbms@jama>
References: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1469035439-23466-1-git-send-email-cynthia.ms.chiu@gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH v3] Pointing the LIC_FILES_CHKSUM to a valid file.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 12:55:37 -0000
X-Groupsio-MsgNum: 62360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bfwklkhpmdkgzhul"
Content-Disposition: inline

--bfwklkhpmdkgzhul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 20, 2016 at 11:23:59AM -0600, cynthiachiu wrote:
> Signed-off-by: cynthiachiu <cynthia.ms.chiu@gmail.com>
> ---
>  meta-oe/recipes-extended/canopennode/canopensocket_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb b/=
meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> index 7c58a26..1e0f7d0 100644
> --- a/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> +++ b/meta-oe/recipes-extended/canopennode/canopensocket_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Linux CANOpen tools"
>  DESCRIPTION =3D "Linux CANOpen Protocol Stack Tools"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://gpl-2.0.txt;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"

LICENSE.GPL also doesn't exist, FFW test your patches before sending
them.

Dropped from master-next until someone sends *tested* version.

>  SRC_URI =3D "gitsm://github.com/CANopenNode/CANopenSocket.git"
>  SRCREV =3D "7777653da3a630b0dc02b3fa5ff029d9bc57cd26"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bfwklkhpmdkgzhul
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleYr0oACgkQN1Ujt2V2gBwNkACeK3hRGX0a9+wVoxoDaJm0Sut3
Tx8AnijztrNs+X839O3Vsd8w4YUdnh/y
=7KEI
-----END PGP SIGNATURE-----

--bfwklkhpmdkgzhul--
