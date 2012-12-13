Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tj6nC-0004WG-1P
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 12:17:32 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1305898pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 03:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bPUHOUWJDlUOIreFJdEiUinmTOSQaJ7tjfrb6asE/mc=;
	b=fefN/gv52GW8T2MEgYbWNm3eu68rUFIzaGQ5P6vpcrNK8XrDRw+HcVc4UDV9MmqKob
	F6NaERIJgF7ggtGfpQK59rUhMV5rUfTgpKgCekYIS1prtG+POIz/LAIwhHF6vEW1WKN4
	Md51kJTkUu7xFQe0Wtr0puMxTP4q2qgkK3xqZmgGy4QTF1lDH2ckzi51ULL52RZeVAsh
	E+dc21HlAb5aV+E5a07o+2NDoJwhASTmAi0J30TYTZul5oSkmA0LevHbG21/gMSEI2cr
	NENLTfdVqU3a+ASEPhqJGKPakJO0gC4NZaPp9xZW1tt/nGrHaAlkwr0ipuZJbc514SWl
	U8tw==
Received: by 10.68.129.227 with SMTP id nz3mr4192869pbb.111.1355396574039;
	Thu, 13 Dec 2012 03:02:54 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id z10sm1070649pax.38.2012.12.13.03.02.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Dec 2012 03:02:52 -0800 (PST)
Date: Thu, 13 Dec 2012 12:03:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121213110305.GC3356@jama.jama.net>
References: <1355394929-25182-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1355394929-25182-6-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1355394929-25182-6-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 5/7] xorg-sgml-doctools: added LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 11:17:32 -0000
X-Groupsio-MsgNum: 42121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline

--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 13, 2012 at 11:35:27AM +0100, Marcin Juszkiewicz wrote:
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

This was already part of my previous pull request which was merged
yesterday, are you using latest meta-openembedded?

Cheers,

> ---
>  meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb =
b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> index 502723c..a75c41d 100644
> --- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> +++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
> @@ -1,4 +1,7 @@
>  require xorg-doc-common.inc
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8c6c808cd3c797a07b24e443af1c=
449"
> +
>  PE =3D "1"
>  PR =3D "${INC_PR}.0"
> =20
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDJtekACgkQN1Ujt2V2gBxF4gCfSU+nQjSM4VFm9Zl9BVWtLdRy
wkAAoLFN8RlXJXU7pVAelR6q8GnDzZFn
=XZx1
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
