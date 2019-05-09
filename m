Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 765817DF7E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 16:07:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w12so3863141wrp.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 09:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9gnMtA1qKngW6OZDzD5L4UBbLby1LnlIdcDrx9dILSA=;
	b=c0Z7hcnqYjRXxFOEfQDDdKvecbBxntn57D7qBwwFZ0X8QixycrXN+pFHwLGi8fn+vf
	vYBFc3QEVTJZe4aoD0ajkEocoMcQJtt2E3ycF+TKovlQ0BKcML3ap3tuEDwqd2eJy4gE
	pjfqy3ua8JX1Lue/AJKdeQD2txOT14PMxI1vPV1gdukx0TPBSXp+6DtaqakdMnUIVlta
	T8b3fkGuDIhPPe1+dBlsXRITICedloj/ppF5TSEsMRah0SmyPupqIMkuLHbJ4+g2dxyp
	qmVGyIJdYoMzdgiE6cGaoBSHL3apSqlqOuN7hRAzKN058Iap0r3UJf1NoN4bmuZMdJuj
	hYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=9gnMtA1qKngW6OZDzD5L4UBbLby1LnlIdcDrx9dILSA=;
	b=je7I/0593eE5X0kv/gL0X49HKM/B/xJpoHwW5pE8Pidl/C3mc48gZoCJtXHqTOY5aQ
	zfnRAQtW09ddJ9iKE10rHHr7I+YDkdk2aYhce2ZuTtiB8O2gmi1uuahOarpYmDsfIRM7
	AjvV24tUMf2LG8kiX92aPeAfocKDWtFpHxseWKPKOuwVa5Ok2ITXdQNaAlprG2d77fYd
	ffMiUe+oYI+7NMwssew4lKSM3KbD4WoMIPtQgUThWOpyCTpTVCAeCp91oXUmaH3g3Jrv
	k5xYvpU0hiuYNyKy14CgtPs30+uXZ8Mzd3lQDU2nulciiocCsbte9w8JNsP55tNhVE18
	MVnQ==
X-Gm-Message-State: APjAAAVZT5HJJc3GL+89xRGaAjeJzVsFewmrG/4Hdb8GlI3HgMfXlRpC
	oqckcBpuPNfD1rcKjZ9BwZ2HqVLI
X-Google-Smtp-Source: APXvYqyyy6A8PdfEJojcaodDF+hdhdLJzB+wOi3FLS87neenjUPkKEwmKleuDGfaFawbGJay9eceVQ==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr3782536wrj.249.1557418037771; 
	Thu, 09 May 2019 09:07:17 -0700 (PDT)
Received: from ?IPv6:2a01:598:b10b:f504:e5e0:c0c4:8f44:31cc?
	([2a01:598:b10b:f504:e5e0:c0c4:8f44:31cc])
	by smtp.gmail.com with ESMTPSA id
	c130sm4244871wmf.47.2019.05.09.09.07.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 09:07:16 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16E227)
In-Reply-To: <20190509081557.383974-1-parthitce@gmail.com>
Date: Thu, 9 May 2019 18:07:15 +0200
Message-Id: <845976C0-9771-46A4-927C-429CE67147BB@gmail.com>
References: <20190509081557.383974-1-parthitce@gmail.com>
To: Parthiban Nallathambi <parthitce@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] python3-tinydb: add version 3.13.0
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
X-List-Received-Date: Thu, 09 May 2019 16:07:17 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Sorru but no. You should not copy native-specific configuration into target d=
irectories. The correct way is to depend on target python3, and fix resultin=
g failures.

Alex

> On 9 May 2019, at 10.15, Parthiban Nallathambi <parthitce@gmail.com> wrote=
:
>=20
> Note:
> Installation expects _sysconfigdata.py in native python DIR,
> but python3 doesn't have copy for it. Adding the copy in python3
> recipe breaks other python packages.
>=20
> Patched locally in _prepend specific to tinydb
>=20
> Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
> ---
> .../recipes-devtools/python/python-tinydb.inc | 20 +++++++++++++++++++
> .../python/python3-tinydb_3.13.0.bb           |  2 ++
> 2 files changed, 22 insertions(+)
> create mode 100644 meta-python/recipes-devtools/python/python-tinydb.inc
> create mode 100644 meta-python/recipes-devtools/python/python3-tinydb_3.13=
.0.bb
>=20
> diff --git a/meta-python/recipes-devtools/python/python-tinydb.inc b/meta-=
python/recipes-devtools/python/python-tinydb.inc
> new file mode 100644
> index 000000000..f79daa0f2
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-tinydb.inc
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "TinyDB is a lightweight document oriented database"
> +DESCRIPTION =3D "\
> +TinyDB is a lightweight document oriented database optimized for \
> +your happiness. It's written in pure Python and has no external \
> +dependencies. The target are small apps that would be blown away \
> +by a SQL-DB or an external database server."
> +HOMEPAGE =3D "https://github.com/msiemens/tinydb"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc03ea0a450e50a3a05d5a746504cb2=
eb"
> +
> +SRC_URI[md5sum] =3D "2824877e9ecfd9db5b64fdf079819358"
> +SRC_URI[sha256sum] =3D "a05c4c81e6e867c4f8a2e51c5236d0d897019aa5e9296f594=
7455b0bdd3c519d"
> +
> +PYPI_PACKAGE =3D "tinydb"
> +inherit pypi python3-dir
> +DEPENDS =3D "${PYTHON_PN}-pytest-runner-native"
> +
> +do_install_prepend() {
> +    install -m 0644 ${WORKDIR}/recipe-sysroot-native/usr/lib/python-sysco=
nfigdata/_sysconfigdata.py ${WORKDIR}/recipe-sysroot-native/usr/lib/${PYTHON=
_DIR}
> +}
> diff --git a/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb b=
/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
> new file mode 100644
> index 000000000..8996b2d44
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-tinydb_3.13.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-tinydb.inc
> --=20
> 2.21.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

