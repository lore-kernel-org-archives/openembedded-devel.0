Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 556C86093D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:28:06 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so15214269pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=x7545X3ZxlrOYP4272GL4TPRhb9lEjqw/8wnAUEVpnU=;
	b=Q8y9aPZ+c1MXJx0ic2PEbqLa9QA5pZ02wBiduIiW5jKLvs9NFDpC8IevhR+JAXXIqa
	nbeFNL+RUoMB2SsYPIn7Jtbfl1lXm5zb/5TnRD9xTQGzj8Cyh9yprsA8/IP85kBnlcuL
	lrdcuAQ50/Fvh6efwUfLNdTR20usqrC3TxYZ0GyWRowuhZ7wnpw8pXBmAFPR7lbCh95E
	eDptubz2Qf1dV/K+dLMs/+VzVzRfT9KJB250QBe/L+xsqWfKJKlQzeVi6Oas8QuSMEmx
	qL8xTFt/liOUIlKt+Z968oZRLn3fWTW/fUaPWDd7WFG9z7Sap83Wva2bDoxzSPLDNTlN
	uJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=x7545X3ZxlrOYP4272GL4TPRhb9lEjqw/8wnAUEVpnU=;
	b=I0V95Zf6sQsGE0EcIZwH4V7jNazykTxpYq3tnq0/gEE2NOxs3fm7kVESbdG8Nlbd+s
	WYv+aGsg1IrRzbSIIUMGHP1gywtVVAJS9Aoce4x4nfnHSy3bumIzY7v6vZtJ1n1bsUz0
	CgsLyD+sUbAUf7vj3/SfSPXRJ8dC7y1S6vf0vzzI4bS2UGCBrq4oIMxBvQZxsEfGiZDk
	+Oi6Hbd/3loP0ytgcT6MZBvwh+a3mEL3r8C3BOlesSsOArXa/65cI8WBbLfYBbueaSjU
	QteB6M0kmrrXkDzjAdT0D7zrFk4uLTJYyrTD5r/KD42Wy9Mqf4nOBQh6lAOqRhlktIII
	Vrjw==
X-Gm-Message-State: ABUngvdEw4lKJOPJsQEe3UljVMUi6S+ONMysw0JmvIiUw7yHyIVXawWNryPKb6ZKWKEBWw==
X-Received: by 10.99.185.4 with SMTP id z4mr10644978pge.133.1479317287579;
	Wed, 16 Nov 2016 09:28:07 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:253b:db0b:7823:74ba])
	by smtp.gmail.com with ESMTPSA id m66sm6057893pfm.3.2016.11.16.09.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Nov 2016 09:28:06 -0800 (PST)
To: openembedded-devel@lists.openembedded.org, =?UTF-8?Q?Andr=c3=a9_Draszik?=
	<git@andred.net>
References: <20161115154311.30118-3-git@andred.net>
	<20161116090234.30806-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
Date: Wed, 16 Nov 2016 09:28:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <20161116090234.30806-1-git@andred.net>
Subject: Re: [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
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
X-List-Received-Date: Wed, 16 Nov 2016 17:28:06 -0000
X-Groupsio-MsgNum: 63842
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="6hckidCbfG0UojSC0qoNRnw8xbSlTO3i1"

--6hckidCbfG0UojSC0qoNRnw8xbSlTO3i1
Content-Type: multipart/mixed; boundary="pTEAEDGfVuvh7urxtHb8WV1iE3NRow77S";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, =?UTF-8?Q?Andr=c3=a9_Draszik?=
 <git@andred.net>
Message-ID: <109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
References: <20161115154311.30118-3-git@andred.net>
 <20161116090234.30806-1-git@andred.net>
In-Reply-To: <20161116090234.30806-1-git@andred.net>

--pTEAEDGfVuvh7urxtHb8WV1iE3NRow77S
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/16/16 1:02 AM, Andr=C3=A9 Draszik wrote:
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
>  meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32 ++++++++++++++++=
++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb
>=20
> diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-ne=
tworking/recipes-support/ncp/ncp_1.2.4.bb
> new file mode 100644
> index 0000000..7bbaaad
> --- /dev/null
> +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "a fast file copy tool for LANs"
> +DESCRIPTION =3D "ncp is a utility for copying files in a LAN. It has a=
bsolutely no \
> +security or integrity checking, no throttling, no features, except \
> +one: you don't have to type the coordinates of your peer."
> +HOMEPAGE =3D "http://www.fefe.de/ncp"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GP=
L-2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +DEPENDS =3D "libowfat"
> +
> +SRC_URI =3D "https://dl.fefe.de/${BP}.tar.bz2"
> +SRC_URI[md5sum] =3D "421c4855bd3148b7d0a4342942b4bf13"
> +SRC_URI[sha256sum] =3D "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0b=
b095a73c24b9359b88"
> +
> +EXTRA_OEMAKE =3D "\
> +    DIET=3D \
> +    DEBUG=3Dnostrip \
> +    CC=3D'${CC}' CFLAGS=3D'${CFLAGS} -I${STAGING_INCDIR}/libowfat' LDF=
LAGS=3D'${LDFLAGS}' \
> +"

Is setting CC etc. on make cmdline really needed ?
may be just adding the -I flags to CPPFLAGS is enough ?

> +
> +do_install() {
> +    install -d -m0755 ${D}${bindir}

not needed if you can just do

install -D -m 0755 ncp ${D}${bindir}/ncp

and avoid two calls to install ( one for dir and another for file )

> +    install -d -m0755 ${D}${mandir}/man1
> +
> +    install -m0755 ncp ${D}${bindir}


> +    ln -sf ncp ${D}${bindir}/npoll
> +    ln -sf ncp ${D}${bindir}/npush
> +
> +    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1

same here not needed.

> +    ln -sf npush.1 ${D}${mandir}/man1/npoll.1
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>=20


--pTEAEDGfVuvh7urxtHb8WV1iE3NRow77S--

--6hckidCbfG0UojSC0qoNRnw8xbSlTO3i1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgslyUACgkQuwUzVZGdMxTogACfXN+F3t6urQOhYpVoEjXcH7CB
kcQAn24XsMlbryuwKMXUvO0JN+T7tmZp
=tTF5
-----END PGP SIGNATURE-----

--6hckidCbfG0UojSC0qoNRnw8xbSlTO3i1--
