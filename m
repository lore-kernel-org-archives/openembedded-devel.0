Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E02827723C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:01:23 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so268351166wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fOBGVJ91WGaQjeIpspNioYrGVPcB9HlP5a26AYkWsKg=;
	b=woTMWl5Gt/P+TjOQjyIdGmM0VBh8aXHZ0jWBIqtg8I6vIVuJ0xTjoHCfo1cL9oEIFy
	ALH/8ck4clWMWcKJT6h/LDNeEpBn275JFlfhnT3YBfHsVyf7DVMueRAPp3ljSJsoX90i
	te1uz5iWxnmRnaLSPJ/RpFDqlMzyDWcJUlVjV/mkuZiLL1R0+E4uBk5eQKZcb9mo2m42
	JR02TFi7gNBZ/tyQ5/IJiNkpsVDus6y9w9JCZjX6le/gZSp57I3udljLGh4wxx0lpneY
	QP4PIjB434wf+3eUkSatBpJq0QrDDmPjJfB/hoN2k2SL/shUCApZOkYACEess9jdeXZ1
	cqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=fOBGVJ91WGaQjeIpspNioYrGVPcB9HlP5a26AYkWsKg=;
	b=ePPrM921c6HHZ7eXMtnddOIRo+JvPHdxNDPqQo9OGghSS5ZyWkSMGU3Yhvd1vO3x3T
	TTZAGDcXtw3q4ZmeAng74vPcNXRs6QCzPpF1HTjWGRg3i8igsvMtG585rNr/emBKSopp
	mHaq6aEa2J1AzdwHFf29swRGMcnvcRYNgNSsvq8kdououx44qzjv7PuQ7rO3QiMgnAWz
	pVinuvhPOhHzMXdZivGPUm8MzzqLLXWowC9OaKBg2P7U1Ipdut5oBHmyQUa3P8PFAXmI
	Og/CtpWsOhLHeIa01kyyX88axgjXHsqJREBpwIroVVVjK9lAyw/E85K1CwK0k96HCiI1
	ReYQ==
X-Gm-Message-State: AG10YOQXD1UaZA12JrbjqThHCHQ4QO4ufeU/BIhS0UFaQY9joOv3ut5xrjbrnUYIVDp4UQ==
X-Received: by 10.194.222.234 with SMTP id qp10mr38728754wjc.138.1456318884194;
	Wed, 24 Feb 2016 05:01:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t12sm31131099wmt.20.2016.02.24.05.01.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 05:01:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 14:02:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160224130229.GC7560@jama>
References: <1448990780-11060-1-git-send-email-philip@balister.org>
	<1448990780-11060-2-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1448990780-11060-2-git-send-email-philip@balister.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python][PATCH 2/3] python-txws: Add new recipe.
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
X-List-Received-Date: Wed, 24 Feb 2016 13:01:28 -0000
X-Groupsio-MsgNum: 60179
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 12:26:19PM -0500, Philip Balister wrote:
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  .../recipes-connectivity/python-txws/python-txws_0.9.1.bb | 15 +++++++++=
++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-connectivity/python-txws/python-t=
xws_0.9.1.bb

The log isn't useful, but it fails in world

ERROR: python-txws-0.9.1-r0 do_compile: python setup.py build execution fai=
led.
ERROR: python-txws-0.9.1-r0 do_compile: Function failed: do_compile (log fi=
le is located at /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-=
linux-gnueabi/python-txws/0.9.1-r0/temp/log.do_compile.21053)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/armv5te-oe-linux-gnueabi/python-txws/0.9.1-r0/temp/log.do_compile.=
21053
NOTE: recipe python-txws-0.9.1-r0: task do_compile: Failed

>=20
> diff --git a/meta-python/recipes-connectivity/python-txws/python-txws_0.9=
=2E1.bb b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
> new file mode 100644
> index 0000000..ceed228
> --- /dev/null
> +++ b/meta-python/recipes-connectivity/python-txws/python-txws_0.9.1.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION =3D "Twisted Web Sockets"
> +HOMEPAGE =3D "https://github.com/MostAwesomeDude/txWS"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D76699830db7fa9e897f6a1ad05f98=
ec8"
> +
> +DEPENDS =3D "python-twisted python-six python-vcversioner"
> +
> +SRC_URI =3D "git://github.com/MostAwesomeDude/txWS.git"
> +SRCREV=3D "88cf6d9b9b685ffa1720644bd53c742afb10a414"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNqdkACgkQN1Ujt2V2gBxiVgCglsO3ZRyL+j3xcYRhYtVnmYg1
/mgAmwWOSb8Gs52LCBgEJ2W2A0KCtBPv
=CmZk
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
