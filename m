Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39A67C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.3629.1637251903929438920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 552211042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2CD63F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/19] python3-pyzmq: set precise BSD license
Date: Thu, 18 Nov 2021 16:11:38 +0000
Message-Id: <20211118161138.663375-19-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211118161138.663375-1-ross.burton@arm.com>
References: <20211118161138.663375-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94044

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb =
b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
index 3c91eee16f..87605c2b3e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.3.0.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Pyzmq provides Zero message queue access for the Python lan=
guage"
 HOMEPAGE =3D "http://zeromq.org/bindings:python"
-LICENSE =3D "BSD & LGPL-3.0"
+LICENSE =3D "BSD-3-Clause & LGPL-3.0"
 LIC_FILES_CHKSUM =3D "file://COPYING.BSD;md5=3D11c65680f637c3df7f58bbc8d=
133e96e \
                     file://COPYING.LESSER;md5=3D12c592fa0bcfff3fb0977b06=
6e9cb69e"
 DEPENDS =3D "zeromq"
--=20
2.25.1


