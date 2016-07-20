Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DCDC760722
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:04:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x83so7162039wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=eQTluRIyxXZ3ul+S3LWP8ZuU5PGtnnzVDG6+EcY0Gxk=;
	b=R7SVDUYYgCr+/a339Gupca56BGoLtwrGlrRofj9eL9UNEaj7fG77wkq5MZVE50j79j
	qJj5J686zqiEQ4ZnW1MrG608YeiLoe0RtUNefdkNXkTjgVFk0HAXCW13CPvx+72EJoBc
	THyT0kffwyCurLT5nkJ3fLyaf5KuMimCvJ69PNBfObEb5dxM9v6ZruEBw0jPgezTAB8j
	KPXARWY09JZR1u2sL1GQc3njiy4SzDpW61OnaoKIiR3rxc1kQ0HXqCMELcJ9eAEer6Cz
	o5qe6m4DclouekOR0DVrJTBS3L6z6nD4s+ekunUW8dv7/z3gXAOCsPNv+VXWFasaItGV
	3Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=eQTluRIyxXZ3ul+S3LWP8ZuU5PGtnnzVDG6+EcY0Gxk=;
	b=WUTXxkdroAokUaMaDF89eDM7VOio1bxKi+lkgFcrjVNP7RtG6Gs4XbcDfw4BlOg9tN
	S9Y3TdFmhNpYmbrWzdPl5ut8no4xQtcavNser20JZ70ixgHK5KDWnQc+1fUCLlkFcv/A
	8EcSeSw7TON/x4HA/iVQyF4Wf8vAvH64Y8KC2YdLJZ0iqtO+1n2kLGrbt6EbSjb5OL2a
	I8VX+VNcSf2YGV2ZJ0iiBWtVcwm74GNNJTMa8h1/2LZgvMgD66VtlhpLS1avJ8EABZPQ
	WoN9CoxrRxCubz+E46xidadmVaX054JRH5PxPjrPkjajYReQ4T8ay2IgzqGk6mVohciG
	PeCw==
X-Gm-Message-State: ALyK8tLUx3CCSfpVVVYlRZ6lg4CjGifuaRdF94vDpDAYFt9widBS3j7VbftPmU2kBK4hQQ==
X-Received: by 10.28.134.14 with SMTP id i14mr11111076wmd.59.1469023473606;
	Wed, 20 Jul 2016 07:04:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	w129sm5324287wmd.9.2016.07.20.07.04.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Jul 2016 07:04:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Jul 2016 16:04:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160720140438.aladpjkzdb2j7jhd@jama>
References: <1468759895-10992-1-git-send-email-derek@asterius.io>
MIME-Version: 1.0
In-Reply-To: <1468759895-10992-1-git-send-email-derek@asterius.io>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-python][PATCH] python-flask-bcrypt: update package RDEPENDS
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
X-List-Received-Date: Wed, 20 Jul 2016 14:04:37 -0000
X-Groupsio-MsgNum: 62264
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uaqkfulu7v4gdvgo"
Content-Disposition: inline

--uaqkfulu7v4gdvgo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:51:35AM -0400, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>

I'm not sure which recent changes are causing this, but bitbake world
now shows couple ERROR messages:

ERROR: Nothing RPROVIDES 'python-io-native' (but virtual:native:/home/jenki=
ns/oe/world/shr-core/meta-openembedded/meta-python/recipes-devtools/python/=
python-cffi_1.7.0.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-io-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-io-native']
NOTE: Runtime target 'python-cryptography-vectors' is unbuildable, removing=
=2E..
Missing or unbuildable dependency chain was: ['python-cryptography-vectors'=
, 'python-cryptography', 'python-cffi-native', 'python-io-native']
NOTE: Runtime target 'python-cryptography-vectors-dev' is unbuildable, remo=
ving...
Missing or unbuildable dependency chain was: ['python-cryptography-vectors-=
dev', 'python-cryptography', 'python-cffi-native', 'python-io-native']
ERROR: Nothing RPROVIDES 'python-bcrypt' (but /home/jenkins/oe/world/shr-co=
re/meta-openembedded/meta-python/recipes-devtools/python/python-bcrypt_3.1.=
0.bb, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/recipes=
-devtools/python/python-flask-bcrypt_0.7.1.bb RDEPENDS on or otherwise requ=
ires it)
ERROR: No eligible RPROVIDERs exist for 'python-bcrypt'
NOTE: Runtime target 'python-bcrypt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-bcrypt']
NOTE: Runtime target 'python-flask-bcrypt-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-flask-bcrypt-dev', 'p=
ython-bcrypt']
ERROR: Nothing RPROVIDES 'python-bcrypt-dev' (but /home/jenkins/oe/world/sh=
r-core/meta-openembedded/meta-python/recipes-devtools/python/python-bcrypt_=
3.1.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-bcrypt-dev'
NOTE: Runtime target 'python-bcrypt-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-bcrypt-dev']
ERROR: Nothing RPROVIDES 'python-cryptography' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-crypt=
ography_1.4.bb, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-pyth=
on/recipes-devtools/python/python-pyopenssl_16.0.0.bb RDEPENDS on or otherw=
ise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-cryptography'
NOTE: Runtime target 'python-cryptography' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-cryptography']
ERROR: Nothing RPROVIDES 'python-pyopenssl' (but /home/jenkins/oe/world/shr=
-core/meta-openembedded/meta-python/recipes-devtools/python/python-pyopenss=
l_16.0.0.bb, /home/jenkins/oe/world/shr-core/meta-openembedded/meta-python/=
recipes-connectivity/gateone/gateone_git.bb RDEPENDS on or otherwise requir=
es it)
ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl'
NOTE: Runtime target 'python-pyopenssl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pyopenssl']
NOTE: Runtime target 'gateone' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gateone', 'python-pyopenssl']
NOTE: Runtime target 'gateone-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gateone-dev', 'python-pyopen=
ssl']
ERROR: Nothing RPROVIDES 'python3-zlib' (but /home/jenkins/oe/world/shr-cor=
e/meta-openembedded/meta-python/recipes-devtools/python/python3-werkzeug_0.=
11.10.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-zlib' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-zlib']
NOTE: Runtime target 'python3-werkzeug' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-werkzeug', 'python3-=
zlib']
NOTE: Runtime target 'python3-flask-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-dev', 'python3=
-werkzeug', 'python3-zlib']
NOTE: Runtime target 'python3-flask' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask', 'python3-wer=
kzeug', 'python3-zlib']
NOTE: Runtime target 'python3-flask-pymongo-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-pymongo-dev', =
'python3-flask', 'python3-werkzeug', 'python3-zlib']
NOTE: Runtime target 'python3-flask-login' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-login', 'pytho=
n3-flask', 'python3-werkzeug', 'python3-zlib']
NOTE: Runtime target 'python3-flask-login-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-login-dev', 'p=
ython3-flask', 'python3-werkzeug', 'python3-zlib']
NOTE: Runtime target 'python3-werkzeug-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-werkzeug-dev', 'pyth=
on3-zlib']
ERROR: Nothing RPROVIDES 'python-pyopenssl-dev' (but /home/jenkins/oe/world=
/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-pyop=
enssl_16.0.0.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-pyopenssl-dev'
NOTE: Runtime target 'python-pyopenssl-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-pyopenssl-dev']
ERROR: Nothing RPROVIDES 'python-cryptography-dev' (but /home/jenkins/oe/wo=
rld/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-c=
ryptography_1.4.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-cryptography-dev'
NOTE: Runtime target 'python-cryptography-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-cryptography-dev']
ERROR: Nothing RPROVIDES 'python3-flask-pymongo' (but /home/jenkins/oe/worl=
d/shr-core/meta-openembedded/meta-python/recipes-devtools/python/python3-fl=
ask-pymongo_0.4.1.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python3-flask-pymongo'
NOTE: Runtime target 'python3-flask-pymongo' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-flask-pymongo']
ERROR: Nothing RPROVIDES 'python-flask-bcrypt' (but /home/jenkins/oe/world/=
shr-core/meta-openembedded/meta-python/recipes-devtools/python/python-flask=
-bcrypt_0.7.1.bb RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'python-flask-bcrypt'
NOTE: Runtime target 'python-flask-bcrypt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python-flask-bcrypt']

Can you please check why?

> ---
>  meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.=
1.bb b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> index d08883d..f035862 100644
> --- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION =3D "Brcrypt hashing for Flask."
> +DESCRIPTION =3D "Bcrypt hashing for Flask."
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ee2ee5bee7fe96597770e92db571=
9a8"
> =20
> @@ -9,4 +9,4 @@ PYPI_PACKAGE =3D "Flask-Bcrypt"
> =20
>  inherit pypi setuptools
> =20
> -RDEPENDS_${PN} =3D "python-bcrypt"
> +RDEPENDS_${PN} +=3D "${PYTHON_PN}-bcrypt ${PYTHON_PN}-flask"
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

--uaqkfulu7v4gdvgo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlePhPYACgkQN1Ujt2V2gByTCQCeN3Xho1c0/mQGk0acAP0CvjFA
tKQAoIAnoL2xU/CFx6YWiNAcm3KzpWfi
=6caH
-----END PGP SIGNATURE-----

--uaqkfulu7v4gdvgo--
