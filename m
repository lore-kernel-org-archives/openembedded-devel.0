Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D101B77156
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:55:40 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so10431644wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MdL170K/Z+C6wo4C8lSyD2hnv2DEpYIQ09hvOvHq0J4=;
	b=mqM4+oiSQtkVNURlGuNPckj+aAcCSp23rARc9L9aBTwUpQ+hyynUnqhvkagErt06sp
	nLIBq/CqsBn55q7yjwZ3OVN5KqG6KE/tNyG9GFeA7l1bLwuo3OGHznk5pdz7WRExYLId
	J78CikmtzH7n19FKmV7CX97xTQ/i1u9ciGchOp5FDXrdy5/qsGmjN3ECIpWlZW2trJdy
	PstyByu367TxgsH1RCOIdKaOY1TQuC6co+j/Crmz9aTGKqAUOv8rI2NefUj3brTOhSFo
	cdpkgo71iHNgrwBbgh2dkJT73pevuvzdqv2vz4NC7gKzyYNIa6I4xMnN8IgQwB0OkU9A
	RJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MdL170K/Z+C6wo4C8lSyD2hnv2DEpYIQ09hvOvHq0J4=;
	b=EHL3bsjLpQyjh8+BpNvc6RqUgvHVh6enqhczCJWvISE6c9DXQ6PiSzb/3g5FbVIFTL
	8YIOpcLuFCZnKatMFfIQuPNPQhaFxuwv1UCbq9qK0gDHq1iewM7fIXgdNbWVdFP7p7mF
	ddpFAHqfIR9XEjjGrT2zRgPDC1HV4Z2+vIW5C1xTw7VqUQQU6AZmYjtQEKC5GXNK5r4y
	IKcfljfiNdm2uQSBu3gkN0zYaXgnepNjfYNpUIMkwLa7Fyon04OxZjf0+MTYAS0lviLP
	I0YJSig2+b3xE6lWkE1taC5pduhRdbUSwZALyucALhiVDUbLqmoHZKfEaSk9MxC/FuFh
	hyeg==
X-Gm-Message-State: AEkoouuZneBqcLAGA3rPchU4yfeTpuzEktrDXtJNW0wh6//o64rulm+aQGAsOahw6y2+kg==
X-Received: by 10.28.4.194 with SMTP id 185mr14490067wme.91.1471258540580;
	Mon, 15 Aug 2016 03:55:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a184sm16736114wmh.1.2016.08.15.03.55.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 03:55:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 12:55:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160815105542.rc622shiwx3qio4s@jama>
References: <1471250746-1965-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1471250746-1965-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] dstat: 0.7.2 -> 0.7.3
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
X-List-Received-Date: Mon, 15 Aug 2016 10:55:41 -0000
X-Groupsio-MsgNum: 62630
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="25dhaetsiyytyhz6"
Content-Disposition: inline

--25dhaetsiyytyhz6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 04:45:46AM -0400, Wang Xin wrote:
> Upgrade dstat from 0.7.2 to 0.7.3.

Better change was already sent last week:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-August/1085=
24.html

>=20
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  meta-oe/recipes-support/dstat/{dstat_0.7.2.bb =3D> dstat_0.7.3.bb} | 6 +=
+----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta-oe/recipes-support/dstat/{dstat_0.7.2.bb =3D> dstat_0.7.3.bb=
} (71%)
>=20
> diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb b/meta-oe/recip=
es-support/dstat/dstat_0.7.3.bb
> similarity index 71%
> rename from meta-oe/recipes-support/dstat/dstat_0.7.2.bb
> rename to meta-oe/recipes-support/dstat/dstat_0.7.3.bb
> index 63f1812..1e39aea 100644
> --- a/meta-oe/recipes-support/dstat/dstat_0.7.2.bb
> +++ b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
> @@ -5,12 +5,10 @@ and flexibility. Dstat is handy for monitoring systems =
during performance tuning
>  benchmarks or troubleshooting."
>  HOMEPAGE =3D "http://dag.wiee.rs/home-made/dstat"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  SRC_URI =3D "git://github.com/dagwieers/dstat.git"
> -SRC_URI[md5sum] =3D "798e050e2e024f08a272dd4b0e1eba41"
> -SRC_URI[sha256sum] =3D "96d1e6ea2434e477fa97322d92778f68458d7e57bc55bc4f=
72e29467a52cffd1"
> =20
> -SRCREV =3D "5251397eb8d3b284a90bfdfaec0c8e1210146e3f"
> +SRCREV =3D "ebace6d4177f8748f35cec87f7a49946046b0a20"
> =20
>  S =3D "${WORKDIR}/git"
> =20
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

--25dhaetsiyytyhz6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexn60ACgkQN1Ujt2V2gBw5HwCeN8qs3ASEHDVe7EcUGGJnGpNn
fH0AoIf0WRRFowROxTqVV38oPttTinAM
=4dTe
-----END PGP SIGNATURE-----

--25dhaetsiyytyhz6--
