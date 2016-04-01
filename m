Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 86F417017D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 13:37:55 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id 127so20376756wmu.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xbOsAAoJrafFnZ14djfSyoFq4Rn/AT88dtcGPGTLiNU=;
	b=MwPzeP5uIOmRWcit0DhZ6PaqfsjBYD1Jhp5KiYvkoJ7BgmrBnKlB0P7zzZrxSzgSvp
	Rau3ZJiPeVtdvhP5MkMbc2iKlz3rgUrPk82uTxkqXjydH4uHOKCq9Ngph7u+eC+pJV/G
	rzsVFFujv5CE+6UtLC3s2xmUzFY68qIafjwN+Wlv+HviUj+des4NIITQIMpJFpm6PgWh
	mCl6B3r6ThQpuK35a7hpjaPEJbUIyImp4YxLcbYBHqZFBJ6pj7kD7oIFSuoppE8vVhUf
	4cmKlVidagq3h8APVuCvwQx/KBP1gdt77m+m/wPzI9G33az/k1+YAU6FXppAX6Qgrku/
	mNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xbOsAAoJrafFnZ14djfSyoFq4Rn/AT88dtcGPGTLiNU=;
	b=Xx1sN3U8u9FZxlUTTjvXE/SHiHLj/nXEnVCRzlheHRsi614955wzDVW2W5nGMo3Q4z
	1HD2zAAzA8iq6kpycF/2KD0zCtgjZkoS+IfUVOShKhGUSEfWceE8KWz4Jx/5jvLdjUr6
	nCGRJUUYwiFjNzpuXZieu9mof6UlMlLuaGE1N6nzYZAw5fZjgA+KXalMtE6h4qf8i+NK
	JBWzn/Tnx8JQYeGc3CrRa3T0LfiqhTmt1QwS7/7T2xrMQN2XM6Ux2VdgKiSSm82cFSfE
	wYSduqgdh087kogg04yM0pY79KIC5K1Lp5hjV6Wy3ZEZxXyYxHkh40JCBjTQAN3YlXWM
	C6XA==
X-Gm-Message-State: AD7BkJK0rZ00VfYkQWpDn51hfDdpXuyrncsmBB1I0uaJsa1N7DZn0YCtfdSjeH/WgweFIg==
X-Received: by 10.28.173.71 with SMTP id w68mr4132442wme.88.1459517876262;
	Fri, 01 Apr 2016 06:37:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c128sm29862793wma.11.2016.04.01.06.37.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Apr 2016 06:37:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Apr 2016 15:38:09 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160401133809.GF2567@jama>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
MIME-Version: 1.0
In-Reply-To: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Fri, 01 Apr 2016 13:37:56 -0000
X-Groupsio-MsgNum: 60779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline

--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2016 at 12:42:52AM -0600, Eduardo Silva wrote:
> Fluent Bit is an open source data collector for Embedded Linux, this
> patch adds the recipe for version 0.7.2.
>=20
>   Project web site: http://fluentbit.io
>   Documentation   : http://fluentbit.io/documentation/
>=20
> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> ---
>  meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 15 +++++++++++++=
++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
>=20
> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
> new file mode 100644
> index 0000000..fd38e84
> --- /dev/null
> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Fast data collector for Embedded Linux"
> +HOMEPAGE =3D "http://fluentbit.io"
> +BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
> +
> +SRC_URI =3D "http://fluentbit.io/releases/0.7/fluent-bit-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "6df9d676e1d2d782a243e655e144e8ae"
> +SRC_URI[sha256sum] =3D "695b56ce378f56855c9554f88f5d8e4f7b11ba7691284903=
870f779912af4ebe"
> +S =3D "${WORKDIR}/fluent-bit-${PV}"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D2ee41112a44fe7014dce33e2=
6468ba93"

LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =3D "file://LICEN=
SE.. should work fine

> +
> +RDEPENDS_${PN} =3D "zlib"

If it does link with libz then the runtime dependency should be added
automatically by shlibs code in package.bbclass if it's not the case
can you add comment explaining why it needs to be added explicitly?

> +
> +inherit cmake
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb+ecAACgkQN1Ujt2V2gBypBgCfaUSnnnjDe+UhDyZ8z5p+PuK1
MZIAn26tDIbxSM2e3ktBKTAto53qipee
=0EAS
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
