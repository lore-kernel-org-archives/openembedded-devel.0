Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id C57D76B074
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 19:50:42 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id wBBJogH7012991
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2018 20:50:42 +0100
Received: from dev.vm6.ccp.siemens.com ([139.22.37.153])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id wBBJod4A030833;
	Tue, 11 Dec 2018 20:50:42 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id ED86395179E;
	Tue, 11 Dec 2018 20:50:38 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2018 20:49:22 +0100
Message-Id: <20181211194922.28677-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nginx: update stable version to 1.14.2
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
X-List-Received-Date: Tue, 11 Dec 2018 19:50:43 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.15.1.bb => nginx_1.14.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.15.1.bb => nginx_1.14.2.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
index 0f1ba8f6b..d0613ffeb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.14.2.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
 
-SRC_URI[md5sum] = "2dd5a265c54a76b699443931d80a61b9"
-SRC_URI[sha256sum] = "c7206858d7f832b8ef73a45c9b8f8e436bcb1ee88db2bc85b8e438ecec9d5460"
+SRC_URI[md5sum] = "239b829a13cea1d244c1044e830bd9c2"
+SRC_URI[sha256sum] = "002d9f6154e331886a2dd4e6065863c9c1cf8291ae97a1255308572c02be9797"
-- 
2.11.0


