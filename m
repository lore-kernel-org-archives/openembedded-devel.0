Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2twQ-0004AQ-Id
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:46 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=N6ZEZZfmO0vaewp38OLKBpS6DLqjI1XAx7Nmtj96W3g=;
	b=MoAN9VRL83a1oGcUp8QYbBWjFOM4msfogy/vXQFI4Du0UN8hgyU3J1wqjRZQ63DGPt
	x0aY+brDVBNzlLjE1BLWP4bXanD2aWK0DfBtFpNGxRl7xCPS027ITdaBKSwyt8ccaqbI
	v21LWow+auATIa+Mi/D15sQWKpzE/QOCicZ5U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lLJvnzCp0Oa+PMNtnZZEAA656rD//6nj2QmiBVA/mz0kaR74tZGp5DMvKncXtJAbEh
	YbyHTFNp9EzwgFs/XR5dBFh3VeiSEiUY6Bj/Qv4EhzBam9/GuZqjRSV+Pv2enoETarD9
	lzs5VJTqUymD664FRqHONy4zqeiI6PRUzimys=
Received: by 10.204.20.69 with SMTP id e5mr69546bkb.146.1301009156141;
	Thu, 24 Mar 2011 16:25:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm321277bkt.11.2011.03.24.16.25.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:25:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:53 +0100
Message-Id: <ec9b2687843e9600dd405034d3383b91970a8c65.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/8] edbus: add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Mar 2011 23:27:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus.inc b/meta-efl/recipes-efl/efl/edbus.inc
index 641f04a..8fe64d0 100644
--- a/meta-efl/recipes-efl/efl/edbus.inc
+++ b/meta-efl/recipes-efl/efl/edbus.inc
@@ -1,6 +1,7 @@
 DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
 DEPENDS = "dbus ecore"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c36b278587b5b7ac1f73c20b60212778"
 
 inherit efl
 
-- 
1.7.4.1



