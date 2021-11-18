Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3962AC4332F
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3631.1637251913362303386
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F10B1113E
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 984883F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/19] xmlrpc-c: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:21 +0000
Message-Id: <20211118161138.663375-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94045

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index d3aa6d2ea2..e119420d2a 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "XML-RPC for C/C++ is programming librari=
es and related tools to h
 write an XML-RPC server or client in C or C++."
=20
 HOMEPAGE =3D "http://xmlrpc-c.sourceforge.net/"
-LICENSE =3D "BSD & MIT"
+LICENSE =3D "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81ba0750f02176b6f867=
52ea951"
=20
 SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;protoc=
ol=3Dhttps \
--=20
2.25.1


