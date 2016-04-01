Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD8160118
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:02:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i204so3701954wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=8JoA9mMrQna+I7Q5qw9zsp/rtt6DhrNIc+IzcFSD7Es=;
	b=PTrm960YdUga9YzxW3zZZB6wCo0hEhcxpj8ElGXwb6mwXcd7dj+/l+PU8VsmUXIJ/w
	U/XwNf09ke7OiOWZSGmhnXYhFYhjPfcSTJPVFovbuz8iBgdxbspgw+mxHVfxrQrHcGRl
	O60EwXQ9VTQM1BNPtxn2kWYSAq4qZJPpyrcvL+nrBkDAVH1pjvYcK38TB9l1pFHEeEHC
	2ptz5T3gZBlod9IkJKucRQ0HaVAwXZwhvkKm3fJbRCKOBguq4HMALSkroZvytZ09+ET7
	gPLxLIFvBQq/A4yNnTEUOjE6mxXZLk2z6s5S1ktFx+VRNOtPbbf6Rskq+cfvVWxoK1Dw
	IIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=8JoA9mMrQna+I7Q5qw9zsp/rtt6DhrNIc+IzcFSD7Es=;
	b=CIepnQKgo5axM3GSwOhNrL3cFVBOsvF8FzVbIaAl0SuxLqEJd8pVnx5sRNLLFoaWuF
	SUzbJfLFiYsWErSbMfnwNgU1Ea1kbxKErH61ZaYPIPv8YKXCeE6F7oHj4Pu/B3Qr/jBg
	HFigz0OVd3gSOKKVBCyrWgXAeAPgIC/Y8twfQIvYhr2KKteeuTx30KafJnljWR7Lrimb
	gmfIKPT9meVGiLkLSMg0zbeLW8uh1r7qtSZS/5jiixktMWXlImCJ9D6e/NWNNUgSw8bX
	l1g1kDP09R53R9O45Kuqt+OZ0ZuwjZRgRmFRdtGflhA5KWiBFHhI3eKSkodXeACsxfUV
	yZng==
X-Gm-Message-State: AD7BkJJQabn0l1Pvqx1dFKRwwY4cjls7/4ViAwRbxQXiMBZvo+0jkYfN1L4sngLwH3AW6Q==
X-Received: by 10.194.172.99 with SMTP id bb3mr21184289wjc.46.1459508573789;
	Fri, 01 Apr 2016 04:02:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d2sm13461591wjf.28.2016.04.01.04.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 04:02:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 13:03:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160401110307.GB2567@jama>
References: <1459504049-29180-1-git-send-email-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
In-Reply-To: <1459504049-29180-1-git-send-email-gary.bisson@boundarydevices.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: [meta-qt5][PATCH] cinematicexperience: add qtbase-fonts as a runtime dependency
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
X-List-Received-Date: Fri, 01 Apr 2016 11:02:56 -0000
X-Groupsio-MsgNum: 60774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 11:47:29AM +0200, Gary Bisson wrote:
> Avoids the following errors at runtime:
> QFontDatabase: Cannot find font directory /usr/lib/fonts - \
> is Qt installed correctly?

You should probably rather enable fontconfig support in qtbase.

Fonts are gone in qt 5.7 so better to get prepared with 5.6 already.

> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  recipes-qt/examples/cinematicexperience_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-qt/examples/cinematicexperience_1.0.bb b/recipes-qt/=
examples/cinematicexperience_1.0.bb
> index 116127f..5194b10 100644
> --- a/recipes-qt/examples/cinematicexperience_1.0.bb
> +++ b/recipes-qt/examples/cinematicexperience_1.0.bb
> @@ -19,7 +19,7 @@ S =3D "${WORKDIR}/Qt5_CinematicExperience_rpi_${PV}/"
>  #S =3D "${WORKDIR}/Qt5_CinematicExperience_${PV}/"
> =20
>  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
> -RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns"
> +RDEPENDS_${PN} =3D "qtdeclarative-qmlplugins qtgraphicaleffects-qmlplugi=
ns qtbase-fonts"
> =20
>  require recipes-qt/qt5/qt5.inc
> =20
> --=20
> 2.7.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+VWoACgkQN1Ujt2V2gByRDgCfTtVpDhaOvMm9pIm74SjYJfcb
nD0An0xqQyJwcvwBnL9MaEh6FEMvvjRZ
=jLhJ
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
