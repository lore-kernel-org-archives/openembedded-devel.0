Received: from smtp.missinglinkelectronics.com (smtp.missinglinkelectronics.com [94.130.14.54])
 by mx.groups.io with SMTP id smtpd.web11.5889.1621327561488230350
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: missinglinkelectronics.com, ip: 94.130.14.54, mailfrom: stefan.wiehler@missinglinkelectronics.com)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id E9D442044E
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 10:45:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7jZQErd3nxV; Tue, 18 May 2021 10:45:58 +0200 (CEST)
Received: from pfanne-bionic2.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id A42922037C;
	Tue, 18 May 2021 10:45:58 +0200 (CEST)
From: "Stefan Wiehler" <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Subject: [meta-networking][PATCH] restinio: fix license
Date: Tue, 18 May 2021 10:45:39 +0200
Message-Id: <20210518084539.123112-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 .../recipes-connectivity/restinio/restinio_0.6.13.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.1=
3.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index ec9b056e5..e3567961a 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "Cross-platform, efficient, customizable,=
 and robust \
 AUTHOR =3D "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
 HOMEPAGE =3D "https://stiffstream.com/en/products/restinio.html"
 SECTION =3D "libs"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://../LICENSE;md5=3Df399b62ce0a152525d1589a5a4=
0c0ff6"
 DEPENDS =3D "asio fmt http-parser"
=20
--=20
2.29.2

