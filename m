Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B24C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:18:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.25682.1646655501150694726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA573ED1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:18:20 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 756533F73D
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 04:18:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 1/2] python3-meh: fix HOMEPAGE
Date: Mon,  7 Mar 2022 12:18:17 +0000
Message-Id: <20220307121818.1851345-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95851

fedorahosted.org is retired, so set the GitHub page as the homepage.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.b=
b b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
index 16596596a6..9f72b72623 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.1.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "A python library for handling exceptions"
 DESCRIPTION =3D "The python-meh package is a python library for handling=
, saving, and reporting \
 exceptions."
-HOMEPAGE =3D "http://git.fedorahosted.org/git/?p=3Dpython-meh.git"
+HOMEPAGE =3D "https://github.com/rhinstaller/python-meh"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
--=20
2.25.1


