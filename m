Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DEB5873281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 17:02:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w207so4272496wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Vep5W+gfc5/yCKhCyejFm8WVfDcyULi96yxp/0x8GDU=;
	b=TSvjSXYMhQn6R8l/tF0Vp7kYpPNCcxqDU7wf2tssMLyWQUNOxkrbZTpRiiD08izX+w
	G3ohzuPELgJNbatOks7ybhldq/YCM2dt8mPLNWLEaYGf4XwJ+Gx8mkaVQ20uV0TmTfwK
	i6gmzWzY7lwwvWlXro/Tp7BBdcVCjxZBnvwpbCMFqQDiN1fb88ki9/u6CPuKMb8zm90C
	yYFFCJmgLbQaD8yPKronuW8teAAWMWakumwhAxemFEkgoa6HQCvvhWlikD7dGkkmW5Y3
	5MGJ8/nIDK/ZAS84BGJsXLpFErRDiC3sVOpK9wmTGd94PF1+BPS9Bxy8EI3GVFqhXlM5
	4Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Vep5W+gfc5/yCKhCyejFm8WVfDcyULi96yxp/0x8GDU=;
	b=mhYd2upsMQqh7QeKmp66HADFJvvr16Qy+YBpc/AA7zGqLScp9RH+pPVzahkAQ4wjyu
	fNaQzdJMNFSiyzHuh6/2Fx/Qe020eeFE/WMU5YgoZcd6tXYCMeU9Bajy443FeoqD90Hb
	5bJrvXsErinzl22joRODVniqHvXY7N6AIb42WdF/Io6y+9XyD+xvVs3LHuroXH9wD6QX
	KbMcFRyG8RgcSNicY4JogH/+7GHTg5c+QndRahM45JDgIXmTHtF9H/SY5huR9l99qRIN
	U9R6q0lSi2Zv8WwyhDu5/tuy0ESjX+/hZWIhAjnqW53XyjfMGHKmx2rkawMjSpyIABrg
	xCeA==
X-Gm-Message-State: AE9vXwM/mMS5gM+yElTyQAl9/GvK7fXesrBqtu0YvfU0ET4CpZk/SafuXKaYe4f9jqfkhw==
X-Received: by 10.28.2.84 with SMTP id 81mr10309235wmc.72.1472662932498;
	Wed, 31 Aug 2016 10:02:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d64sm9843753wmc.22.2016.08.31.10.02.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 10:02:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 19:02:11 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831170211.o2xcevfr27xmfn2f@jama>
References: <1472182090-2031-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1472182090-2031-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] openwsman: 2.6.2 -> 2.6.3
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
X-List-Received-Date: Wed, 31 Aug 2016 17:02:13 -0000
X-Groupsio-MsgNum: 62911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fmdpbvoghh5gococ"
Content-Disposition: inline

--fmdpbvoghh5gococ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 25, 2016 at 11:28:10PM -0400, Wang Xin wrote:
> Upgrade openwsman from 2.6.2 to 2.6.3.
>=20
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../openwsman/{openwsman_2.6.2.bb =3D> openwsman_2.6.3.bb}              =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/openwsman/{openwsman_2.6.2.bb =3D> openw=
sman_2.6.3.bb} (97%)
>=20
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
> similarity index 97%
> rename from meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
> rename to meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
> index af9633d..cf32351 100644
> --- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.2.bb
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
> @@ -12,8 +12,8 @@ SECTION =3D "Applications/System"
> =20
>  DEPENDS =3D "curl libxml2 openssl libpam"
> =20
> -SRCREV =3D "ed7a119e036c53078d70fd85936d94dc9b9b98be"
> -PV =3D "2.6.2"
> +SRCREV =3D "feb7ec9b004fcaea0dbe65ce8a1a79cc29dd994c"
> +PV =3D "2.6.3"
> =20

Doesn't apply because of this 16 days old change, please REBASE and test
your changes before sending.

commit ff387178b350753ad5dc3c6aa090345434bc26a1
Author:     Armin Kuster <akuster808@gmail.com>
AuthorDate: Tue Aug 9 08:40:37 2016 -0700
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Mon Aug 15 12:31:58 2016 +0200

    openwsman: fix fetch error.

>  SRC_URI =3D "git://github.com/Openwsman/openwsman.git;protocol=3Dhttp \
>             file://libssl-is-required-if-eventint-supported.patch \
> --=20
> 2.7.4
>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fmdpbvoghh5gococ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHDZMACgkQN1Ujt2V2gBykJQCfcIDyzpdSiJRwc8sPyJW5bLVa
CfUAnRkcjOQd3/CxANPbQx2jl7hncX8Y
=5QKb
-----END PGP SIGNATURE-----

--fmdpbvoghh5gococ--
