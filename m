Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5Eys-0000WF-55
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 12:19:58 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1699187bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=AIabK4vYtZbFddcZ2+mEmJchTZctnxQxne7ogL7aFqA=;
	b=CvsM46xCaGBMsCKzz/IdifL9tOZUp8tBqyagPMdtqCKVakcMTG2JA7Gw4jjElrVXhh
	oo+5XfrLFUUcM10419kJN96gEQV8t2yfPKo7KGOeMigVlNVs9Xi4qDpwWaMwvjy/+hhd
	yvqa1O7HEqBJLhpXtZahM+vEr/lEcEvSS0goE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Fz99B0ZCSzRWq1zOgLvKjHffuF5AUktknpN6NMJ37b8JTR0dEwRqDsqIIVT/Kc1P3T
	dz5Mk81m/DbI2p4F1kgwHygtMaxA/JV8OHqex179D7UuPFOrZ6VCL5Rhqkjg+Od7gXAb
	SXUe+69AwwKT3ljONu3kxFGYv1zcLk1fhZamQ=
Received: by 10.204.26.132 with SMTP id e4mr2233099bkc.142.1301566679617;
	Thu, 31 Mar 2011 03:17:59 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm635790bkt.5.2011.03.31.03.17.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:17:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:17:57 +0200
Message-Id: <8d76bc22e6b97944d4af16b2d9a6e318200d857b.1301560589.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301560589.git.Martin.Jansa@gmail.com>
References: <cover.1301560589.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] task-x11-illume: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 31 Mar 2011 10:19:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/tasks/task-x11-illume.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/tasks/task-x11-illume.bb b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
index 8b14adb..e197cc7 100644
--- a/meta-efl/recipes-efl/tasks/task-x11-illume.bb
+++ b/meta-efl/recipes-efl/tasks/task-x11-illume.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "The Illume Windowing Environment -- install this task to get the Enlightenment Window Manager + the Illume environment."
 SECTION = "x11/wm"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
 PR = "r1"
 
-- 
1.7.4.1



