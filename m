Received: from Henrys-MBP.localdomain (Henrys-MBP.localdomain [114.34.172.18])
 by mx.groups.io with SMTP id smtpd.web12.6321.1586156454099833145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 00:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: henrys-mbp.localdomain, ip: 114.34.172.18, mailfrom: jrhenry@henrys-mbp.localdomain)
Received: by Henrys-MBP.localdomain (Postfix, from userid 501)
	id BEA49779690; Tue, 10 Mar 2020 16:12:40 +0800 (CST)
From: "Henry Chang" <mr.changyuheng@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Henry Chang <mr.changyuheng@gmail.com>
Subject: [meta-python][PATCH] python-pandas: upgrade 0.23.4 -> 1.0.1
Date: Tue, 10 Mar 2020 16:11:44 +0800
Message-Id: <20200310081142.34286-1-mr.changyuheng@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Henry Chang <mr.changyuheng@gmail.com>
---
 meta-python/recipes-devtools/python/python-pandas.inc         | 4 ++--
 .../{python3-pandas_0.23.4.bb =3D> python3-pandas_1.0.1.bb}     | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.23.4.bb =3D=
> python3-pandas_1.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta=
-python/recipes-devtools/python/python-pandas.inc
index d6ca24317..9342cedfb 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,8 +6,8 @@ HOMEPAGE =3D "http://pandas.pydata.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dee0470f2de336c370a71c2f8d5e81=
c11"
=20
-SRC_URI[md5sum] =3D "7b597c7f989652e0c9af5f09a157e3ae"
-SRC_URI[sha256sum] =3D "5b24ca47acf69222e82530e89111dd9d14f9b970ab2cd3a1=
c2c78f0c4fbba4f4"
+SRC_URI[md5sum] =3D "628ffa1dd5768e0be70236596cee8d6b"
+SRC_URI[sha256sum] =3D "3c07765308f091d81b6735d4f2242bb43c332cc3461cae60=
543df6b10967fe27"
=20
 inherit pypi
=20
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.4.bb=
 b/meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.23.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.1.bb
--=20
2.25.0

