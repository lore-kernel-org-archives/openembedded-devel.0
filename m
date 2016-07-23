Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A37AC60290;
	Sat, 23 Jul 2016 06:21:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so8704123wmg.2;
	Fri, 22 Jul 2016 23:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=EUJxLLfdq8EEK7vGqm/emKvE3HyemukrrsTjUJUB13o=;
	b=SZln7sGoAm5MbITxvb9PW3UVprJLyjQLYWPsS+b0qZ0Dm5EBMgf9JB1jbdmMkxd3/f
	bA+XsUgkmonsx3vn3J+KPGdItSqsjg43Ov71q4/32uDT4DXog+qDty3KpGsudb2o5qr/
	qg/FhepIFwkZPEJa0J0al8CONQ2rMUAFiyOD3MfRHVpdL+wK8/Uk7FHWfj/Ow6H9oPzL
	SqGQYW59BLrsfT1AjdrxHkb/jQX0KxLtJ4Z/zm7M2OyrZG/atPwhqc81St8PG8Tx/7bA
	x5y8+ZiqyTsA7cVQdEMDOlMysXO7YatYqb9TByffpXTktCellJXEeZq1sHXbFliTKDw1
	HQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=EUJxLLfdq8EEK7vGqm/emKvE3HyemukrrsTjUJUB13o=;
	b=IXcJnw274Olh38Rfpmx518wj8GKsIVKbVq6BAg5gL+LAN1hgZo4U73nOd/AbNYYhOj
	ORnRjt3MV7vufT9C5XC0BNQYfS8PGbLPuMXSmoJUHANf3BmlGXT+E8iHo8nB9+4fLAPJ
	s6DvDruosfE4uwY54v6AgLgF7Bf1g5GjxFoemJ4cqYeExKWYWLzA06NLSAwKaedekAfv
	GsLxPbtem5LVe4ckK09LeKzOinOA1MoSdyRXKZuNzobM4B/O6gbAAjpLQTmVHgY7gWm1
	QSveMHHmyPcSStEaHFSYz79P7GJmB6lobjGY9qDw3hALr4lGE9YRmzj1rSex8YnGq2YC
	xdJg==
X-Gm-Message-State: ALyK8tLVq9xql7Bn5YlBf6OAhpcyuelEfTJqh0xQvTSNNkjCImn+g+xDKST+YhFLVohrJg==
X-Received: by 10.28.186.138 with SMTP id k132mr27767227wmf.65.1469254900302; 
	Fri, 22 Jul 2016 23:21:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	c16sm15952835wme.4.2016.07.22.23.21.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Jul 2016 23:21:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 23 Jul 2016 08:21:49 +0200
To: openembedded-devel@lists.openembedded.org,
	Catalin Enache <catalin.enache@windriver.com>
Message-ID: <20160723062149.u6vo6fim577u23nr@jama>
References: <20160722203820.9106.80470@opal.openembedded.org>
	<20160722203826.E9E1E50212@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160722203826.E9E1E50212@opal.openembedded.org>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 29/32: python-pygpgme: update tests
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
X-List-Received-Date: Sat, 23 Jul 2016 06:21:41 -0000
X-Groupsio-MsgNum: 62321
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="365xkdpbpfp4xwel"
Content-Disposition: inline

--365xkdpbpfp4xwel
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2016 at 08:38:49PM +0000, git@git.openembedded.org wrote:
> martin_jansa pushed a commit to branch master-next
> in repository meta-openembedded.
>=20
> commit aa8e37b8738f1cb088362232da44a71651b05e57
> Author: Catalin Enache <catalin.enache@windriver.com>
> AuthorDate: Fri Jul 22 11:45:53 2016 +0300
>=20
>     python-pygpgme: update tests
>    =20
>     python-pygpgme tests need to be updated in order to
>     be compatible with GnuPG 2.1 and newer versions.
>    =20
>     Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...001-reflect-2.1-reporting-for-key-imports.patch | 88 ++++++++++++++++=
++++++
>  .../0002-passphrase_cb-is-deprecated.patch         | 50 ++++++++++++
>  ...ric-error-when-no-passphrase-callback-pre.patch | 28 +++++++
>  .../recipes-devtools/python/python-pygpgme_0.3.bb  |  6 +-
>  4 files changed, 171 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0001-refl=
ect-2.1-reporting-for-key-imports.patch b/meta-python/recipes-devtools/pyth=
on/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
> new file mode 100644
> index 0000000..f587037
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1=
-reporting-for-key-imports.patch
> @@ -0,0 +1,88 @@
> +From 1c1812def711803382cc28caea1f35fb7ef774b0 Mon Sep 17 00:00:00 2001
> +From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
> +Date: Tue, 26 Jan 2016 14:24:26 -0500
> +Subject: [PATCH 1/5] reflect 2.1 reporting for key imports
> +
> +GnuPG 2.1 changes how it reports key imports.  These changes should
> +make the pygpgme test suite compatible with GnuPG 2.1.
> +
> +See also:
> +https://lists.gnupg.org/pipermail/gnupg-devel/2016-January/030718.html
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + tests/test_import.py | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/tests/test_import.py b/tests/test_import.py
> +index 10eb816..597eb47 100644
> +--- a/tests/test_import.py
> ++++ b/tests/test_import.py
> +@@ -55,7 +55,7 @@ class ImportTestCase(GpgHomeTestCase):
> +         ctx =3D gpgme.Context()
> +         with self.keyfile('key1.sec') as fp:
> +             result =3D ctx.import_(fp)
> +-        self.assertEqual(result.considered, 1)
> ++        self.assertEqual(result.considered, 3)
> +         self.assertEqual(result.no_user_id, 0)
> +         self.assertEqual(result.imported, 1)
> +         self.assertEqual(result.imported_rsa, 0)
> +@@ -64,18 +64,18 @@ class ImportTestCase(GpgHomeTestCase):
> +         self.assertEqual(result.new_sub_keys, 0)
> +         self.assertEqual(result.new_signatures, 0)
> +         self.assertEqual(result.new_revocations, 0)
> +-        self.assertEqual(result.secret_read, 1)
> +-        self.assertEqual(result.secret_imported, 1)
> ++        self.assertEqual(result.secret_read, 3)
> ++        self.assertEqual(result.secret_imported, 2)
> +         self.assertEqual(result.secret_unchanged, 0)
> +         self.assertEqual(result.skipped_new_keys, 0)
> +         self.assertEqual(result.not_imported, 0)
> +         self.assertEqual(len(result.imports), 2)
> +         self.assertEqual(result.imports[0],
> +                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
> +-                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
> ++                          None, gpgme.IMPORT_NEW))
> +         self.assertEqual(result.imports[1],
> +                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
> +-                          None, gpgme.IMPORT_NEW))
> ++                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
> +         # can we get the public key?
> +         key =3D ctx.get_key('E79A842DA34A1CA383F64A1546BB55F0885C65A4')
> +         # can we get the secret key?
> +@@ -102,17 +102,17 @@ class ImportTestCase(GpgHomeTestCase):
> +         fp =3D BytesIO(b'\n'.join(keys))
> +         ctx =3D gpgme.Context()
> +         result =3D ctx.import_(fp)
> +-        self.assertEqual(result.considered, 3)
> ++        self.assertEqual(result.considered, 5)
> +         self.assertEqual(result.no_user_id, 0)
> +         self.assertEqual(result.imported, 2)
> +-        self.assertEqual(result.imported_rsa, 1)
> ++        self.assertEqual(result.imported_rsa, 0)
> +         self.assertEqual(result.unchanged, 0)
> +         self.assertEqual(result.new_user_ids, 0)
> +         self.assertEqual(result.new_sub_keys, 0)
> +         self.assertEqual(result.new_signatures, 1)
> +         self.assertEqual(result.new_revocations, 0)
> +-        self.assertEqual(result.secret_read, 1)
> +-        self.assertEqual(result.secret_imported, 1)
> ++        self.assertEqual(result.secret_read, 3)
> ++        self.assertEqual(result.secret_imported, 2)
> +         self.assertEqual(result.secret_unchanged, 0)
> +         self.assertEqual(result.skipped_new_keys, 0)
> +         self.assertEqual(result.not_imported, 0)
> +@@ -122,10 +122,10 @@ class ImportTestCase(GpgHomeTestCase):
> +                           None, gpgme.IMPORT_NEW))
> +         self.assertEqual(result.imports[1],
> +                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
> +-                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
> ++                          None, gpgme.IMPORT_SIG))
> +         self.assertEqual(result.imports[2],
> +                          ('E79A842DA34A1CA383F64A1546BB55F0885C65A4',
> +-                          None, gpgme.IMPORT_SIG))
> ++                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
> +         self.assertEqual(result.imports[3],
> +                          ('93C2240D6B8AA10AB28F701D2CF46B7FC97E6B0F',
> diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0002-pass=
phrase_cb-is-deprecated.patch b/meta-python/recipes-devtools/python/python-=
pygpgme/0002-passphrase_cb-is-deprecated.patch
> new file mode 100644
> index 0000000..ccd941f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_=
cb-is-deprecated.patch
> @@ -0,0 +1,50 @@
> +From dc75482af095d667a4a92655c4e7eb312e80c42d Mon Sep 17 00:00:00 2001
> +From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
> +Date: Mon, 1 Feb 2016 19:25:12 -0500
> +Subject: [PATCH 2/5] passphrase_cb is deprecated
> +
> +https://bugs.gnupg.org/gnupg/issue767 indicates that
> +gpgme_set_passphrase_cb is a deprecated corner of the API and that
> +developers using gpgme should really rely on the gpg-agent to handle
> +this stuff.  This should actually simplify things for most
> +installations -- just strip out all passphrase handling from your
> +application entirely, relying on gpg to figure out how to find the
> +agent, and relying on the agent figuring out how to prompt the user
> +(if necessary).
> +
> +However, if a developer really wants to use the passphrase callback
> +approach, they'll have to use loopback pinentry.  This sets up the
> +test suite to be able to make those tests.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + tests/util.py | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/tests/util.py b/tests/util.py
> +index cd803c2..86892ca 100644
> +--- a/tests/util.py
> ++++ b/tests/util.py
> +@@ -28,7 +28,9 @@ keydir =3D os.path.join(os.path.dirname(__file__), 'ke=
ys')
> +=20
> + class GpgHomeTestCase(unittest.TestCase):
> +=20
> +-    gpg_conf_contents =3D ''
> ++    gpg_conf_contents =3D 'pinentry-mode loopback'
> ++    gpg_agent_conf_contents =3D 'allow-loopback-pinentry'
> ++
> +     import_keys =3D []
> +=20
> +     def keyfile(self, key):
> +@@ -41,6 +43,10 @@ class GpgHomeTestCase(unittest.TestCase):
> +         fp.write(self.gpg_conf_contents.encode('UTF-8'))
> +         fp.close()
> +=20
> ++        fp =3D open(os.path.join(self._gpghome, 'gpg-agent.conf'), 'wb')
> ++        fp.write(self.gpg_agent_conf_contents.encode('UTF-8'))
> ++        fp.close()
> ++
> +         # import requested keys into the keyring
> +         ctx =3D gpgme.Context()
> diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0003-hand=
le-generic-error-when-no-passphrase-callback-pre.patch b/meta-python/recipe=
s-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphra=
se-callback-pre.patch
> new file mode 100644
> index 0000000..462f442
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-gene=
ric-error-when-no-passphrase-callback-pre.patch
> @@ -0,0 +1,28 @@
> +From 024fe219582143017b2f02bc924c0ed107b63619 Mon Sep 17 00:00:00 2001
> +From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
> +Date: Mon, 1 Feb 2016 19:27:59 -0500
> +Subject: [PATCH 3/5] handle generic error when no passphrase callback pr=
esent
> +
> +apparently gpg 2.1 returns ERR_GENERAL right now if the pinentry was
> +in loopback mode and no passphrase callback was supplied.  Earlier
> +versions supplied ERR_BAD_PASSPHRASE.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> +---
> + tests/test_passphrase.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/test_passphrase.py b/tests/test_passphrase.py
> +index 0a235e9..35b3c59 100644
> +--- a/tests/test_passphrase.py
> ++++ b/tests/test_passphrase.py
> +@@ -41,7 +41,7 @@ class PassphraseTestCase(GpgHomeTestCase):
> +             new_sigs =3D ctx.sign(plaintext, signature, gpgme.SIG_MODE_=
CLEAR)
> +         except gpgme.GpgmeError as exc:
> +             self.assertEqual(exc.args[0], gpgme.ERR_SOURCE_GPGME)
> +-            self.assertEqual(exc.args[1], gpgme.ERR_BAD_PASSPHRASE)
> ++            self.assertEqual(exc.args[1], gpgme.ERR_GENERAL)
> +         else:
> +             self.fail('gpgme.GpgmeError not raised')
> diff --git a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb b/=
meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
> index 03c4790..2fd76fe 100644
> --- a/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
> +++ b/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
> @@ -6,7 +6,11 @@ HOMEPAGE =3D "https://launchpad.net/pygpgme"
>  LICENSE =3D "LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D65=
17bdc8f2416f27ab725d4702f7aac3"
> =20
> -SRC_URI =3D "file://run-ptest"
> +SRC_URI =3D "file://run-ptest \"


This line doesn't even parse, please test the changes before sending
them to ML.

Fixed in master-next.

> +           file://0001-reflect-2.1-reporting-for-key-imports.patch \
> +           file://0002-passphrase_cb-is-deprecated.patch \
> +           file://0003-handle-generic-error-when-no-passphrase-callback-=
pre.patch \
> +          "
> =20
>  SRC_URI[md5sum] =3D "d38355af73f0352cde3d410b25f34fd0"
>  SRC_URI[sha256sum] =3D "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90=
449853a3dfb802e1"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--365xkdpbpfp4xwel
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleTDPsACgkQN1Ujt2V2gBw5+ACfbokuC8Od7xGYBmkG8HL5K3Oo
qOEAoIK3U/INFPQOEHndwmYqTXo6pvHE
=fQh/
-----END PGP SIGNATURE-----

--365xkdpbpfp4xwel--
