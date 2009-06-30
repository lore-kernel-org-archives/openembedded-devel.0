Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MLgYE-0004CY-IU
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 18:51:22 +0200
Received: by ey-out-1920.google.com with SMTP id 5so92341eyb.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2009 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EU2Fsz788gqiyP64sFR+pYc4aEwC8mpBjy3Ojy8FU7o=;
	b=ZaQZACOTzrtHPYud9Umj/nuvKSpkgiWgMSoN1nJx7y9uHpJFw8ErxvOVbTQJJFRlsJ
	yE1fqRy/Fnj1lPRc0AoF5ToXOHgyZrAswL3L3w5mnSZdiRc6hZZ3o92d7srKzHA9XwjB
	DgD+6kbrTGUamTJWu1UVmz69W9l4uq5+In2IQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wInPHGFUzveYe05jWrjNIVcqQHZO6G4zl7qkE648pQwer2KD5LCvspI8xfdF5+ETf6
	eIwqJlCt0gQLpv7qpdOS2b/XThneiVUxDtbgMro3hWsAkgQaH9jn+0HL/AXmECQHTuUq
	AERDqWmMNBWJbRv4jjsoGo4Ia000HhCK/wBsc=
Received: by 10.210.134.5 with SMTP id h5mr3771399ebd.63.1246379973438;
	Tue, 30 Jun 2009 09:39:33 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 28sm690492eyg.34.2009.06.30.09.39.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 30 Jun 2009 09:39:32 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jun 2009 18:39:31 +0200
Message-Id: <1246379971-1420-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] myththv: bump SRCREV
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
X-List-Received-Date: Tue, 30 Jun 2009 16:51:23 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/mythtv/mythtv_0.21.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/mythtv/mythtv_0.21.bb b/recipes/mythtv/mythtv_0.21.bb
index 3594afb..89b9b11 100644
--- a/recipes/mythtv/mythtv_0.21.bb
+++ b/recipes/mythtv/mythtv_0.21.bb
@@ -5,7 +5,7 @@ inherit qmake qt3x11
 PR = "${SRCREV}+r5"
 REALPV = "0.21"
 
-SRCREV = "19479"
+SRCREV = "20763"
 SRC_URI = "svn://svn.mythtv.org/svn/branches/release-0-21-fixes;module=mythtv;proto=http"
 
 SRC_URI += " \
-- 
1.6.1



