Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9336FFCC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 18:18:56 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so8598164pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2016 11:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=SFuBBQVI5ZS1rkwrXLMf3i7UzbZ7/AMnmCi93/STbo8=;
	b=oYqyDycxxHqF4tMuTMvpFgMaYJL8ljp1PVGY8WEysefres288fOG+H/qObn1GHC8BQ
	SwHKk64uUAIZSO5xlzXL+VR3xkHe0uRzGYyww0WesFeRxX0m1vjEIgqkALgMLpGz+T9f
	gWnjtWxI43spj6VtjtNKNN4inZz/mt57n/2qCWUDHnsngfxWROIJ/T4VK9eC973ZrcUs
	FKN0ZzKMmhUubXPBf1tcbdTuFzGYEB6fDI5Z9Wjkhi6tz1YScisu05i0yv3L9EN6TEYw
	N64V8/90T+As/FUXf/zuX/KBZxEKc3cZrjm+DXK++Tx4op/D9sK7VS/K2XIa6nbgffT8
	lagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=SFuBBQVI5ZS1rkwrXLMf3i7UzbZ7/AMnmCi93/STbo8=;
	b=mwgzzWIbj1PXgURe121c4SN89Gcy9eKpFnAuZLxr1ZZK70dvvJEk9P52oa+9Zi845u
	GP2GH1BaHqWl84ABVzxbOhupk6fCF75Var1+gY6M3vcS1U0mV3uKi2paP+SWkQ2CfM0M
	/vlfuyjd64Q1nD0aGLNtPD23HYVf5NccdWZXNPNd+AHQuEpeCajFEbuoEb4runJOQfDe
	Mh2AapJVQtTLZKgeborJqgm0aFmbeanQTG3Yb0VLqyFWG2X799cmXT24hSGXgMY+khyp
	FVPPWXWXBuBE7wb6W/WHprgxMd5x+mp9sHtPFdBn0sEbbEKnLrkLgQcOKou4LLL6EazX
	C2AA==
X-Gm-Message-State: ABUngvfHwJvaIl+QwPfmHbzC8Z1iZ8T0yfVkImSTFIgL/E2LcO+NnDgEdmY1c4+c9ZZ9Ig==
X-Received: by 10.98.44.212 with SMTP id s203mr28918497pfs.84.1478283537932;
	Fri, 04 Nov 2016 11:18:57 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:49a8:f49a:4fb7:80ce])
	by smtp.gmail.com with ESMTPSA id
	n26sm2367740pfi.32.2016.11.04.11.18.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Nov 2016 11:18:57 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>
Date: Fri, 4 Nov 2016 11:18:51 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
Subject: Re: [meta-python][PATCH v2] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Fri, 04 Nov 2016 18:18:57 -0000
X-Groupsio-MsgNum: 63747
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="in7eQHcUMoG2e6fJLIw6O9OvDn40oRaK5"

--in7eQHcUMoG2e6fJLIw6O9OvDn40oRaK5
Content-Type: multipart/mixed; boundary="weQ6pNlHTSgEGC1BoKGancV7k44jFsMgQ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <96645ce4-02c6-5de8-13e0-b6369429860a@gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] python-cassandra-driver: add recipe
 for version 3.6.0
References: <20161104101639.20665-1-ruben.de.smet@rubdos.be>
In-Reply-To: <20161104101639.20665-1-ruben.de.smet@rubdos.be>

--weQ6pNlHTSgEGC1BoKGancV7k44jFsMgQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/4/16 3:16 AM, Ruben De Smet wrote:
> A Python library for Apache Cassandra
>=20
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  .../python/python-cassandra-driver.inc             | 29 ++++++++++++++=
++++++++
>  .../python/python3-cassandra-driver_3.6.0.bb       |  7 ++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-cassandr=
a-driver.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-cassand=
ra-driver_3.6.0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-cassandra-drive=
r.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> new file mode 100644
> index 0000000..0e6113d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> @@ -0,0 +1,29 @@
> +SUMMARY =3D "DataStax Python Driver for Apache Cassandra"
> +DESCRIPTION =3D "A modern, feature-rich and highly-tunable Python clie=
nt \
> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+) usi=
ng \
> +exclusively Cassandra's binary protocol and Cassandra Query Language v=
3."
> +HOMEPAGE =3D "https://github.com/datastax/python-driver"
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e2646=
8ba93"
> +SRCNAME =3D "cassandra-driver"
> +
> +SRC_URI[md5sum] =3D "756a3b235c5766c3072ed62e1083c9ef"
> +SRC_URI[sha256sum] =3D "049c8a871e49052c7b72fddb6569f1bfe738bbfea0a562=
eeeb5404abeff015ab"
> +
> +DISTUTILS_BUILD_ARGS +=3D " \
> +    --no-libev \
> +"
> +DISTUTILS_INSTALL_ARGS +=3D " \
> +    --no-libev \
> +"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} +=3D "\
> +    ${PYTHON_PN}-cython \
> +    ${PYTHON_PN}-multiprocessing \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-json \
> +    libevent \
> +"
> diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driv=
er_3.6.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-drive=
r_3.6.0.bb
> new file mode 100644
> index 0000000..6d7ed20
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.6.=
0.bb
> @@ -0,0 +1,7 @@
> +inherit setuptools3
> +require python-cassandra-driver.inc
> +RDEPENDS_${PN}_class-native =3D ""
> +
> +DEPENDS_${PN} +=3D "\

Dont use PN here.

> +    python3-cython \
> +"
>=20


--weQ6pNlHTSgEGC1BoKGancV7k44jFsMgQ--

--in7eQHcUMoG2e6fJLIw6O9OvDn40oRaK5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgc0Q8ACgkQuwUzVZGdMxS9awCdH6bOyWvM+I0XKpwv8ydQk/0C
nYgAn21vOgkzTURlDPXuGWi+e5sWJzo/
=1Z5T
-----END PGP SIGNATURE-----

--in7eQHcUMoG2e6fJLIw6O9OvDn40oRaK5--
