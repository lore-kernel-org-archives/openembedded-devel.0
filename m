Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2two-0004AQ-Tm
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:28:10 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=TkVekeU8QfGtnapuArZvDV+gRsc23gYbkCtlBOAfFOU=;
	b=jY5fWL/msN11oUvfbjd05ZhrMyDJZ1J/o9EH/4Atirg/SJwykQ63Luu12VbUwa2Lus
	XwKz+hqausDBNWaCMFxZ3ibOS0XraTctXbSJ+d8oqBwz4VvDwGFo35oridRaxTsdAFrC
	F5u5SJyhPQQlJeDXJHuFuGN16M2L9lrv98mA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ubk/moBbGtQhnQUhbYh55jk8LJK5O7zxczrcI0VZ6I/7yIMIHPdhov89c9WCyg/eo/
	KvNFHZiKB6+RF7VGPvcBiYUnU/pOXF+1fPjNTikaxrDePXqjqy8PzJslQAst+kHqUgzB
	v0aiCT+BOXtfHJTrf4xacmVbhmrD2g8c7PtVs=
Received: by 10.204.169.130 with SMTP id z2mr65843bky.137.1301009180372;
	Thu, 24 Mar 2011 16:26:20 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id x6sm320739bkv.12.2011.03.24.16.26.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:26:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:26:13 +0100
Message-Id: <daa0e887d958c90bb69bd0e55c4c3d13e9f2c155.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/8] edje: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 23:28:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edje.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje.inc b/meta-efl/recipes-efl/efl/edje.inc
index c69314f..9d4d222 100644
--- a/meta-efl/recipes-efl/efl/edje.inc
+++ b/meta-efl/recipes-efl/efl/edje.inc
@@ -3,6 +3,7 @@ DEPENDS = "lua5.1 eet evas ecore embryo edje-native"
 DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native"
 DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f2d83425ec8dfae5cd77f8ce52e872c"
 
 inherit efl
 
-- 
1.7.4.1



