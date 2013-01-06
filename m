Received: from mail-gg0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TryhV-0004Wf-PX
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 23:28:24 +0100
Received: by mail-gg0-f179.google.com with SMTP id q1so2915527gge.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 14:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=GyVuvDyXj42Tj/o5j1owNJ/ISu2kyCt0wS8DLPGOVWA=;
	b=aFNC27GLvY2/+qGw0/1k31I/po3jBcP7nCHlz4JURHsnx39tcpdnKMRtVYTBfjuhHe
	usbfLhmsSN5xGtD4SJQm4k+IuYfIoRUDMU+enX5/rOLlfgph9jBTY7kYl/5wkIfu0R/0
	nmNhX+m/Nh6Fa03c6ssPJ9AIlmCK3FZYDM9odmq7mJfMnIGFVUa9FPbNtdHMIoDQVQCp
	KSjjJSNiDiMVCK7xGZBdq8h25IxbKvr5uW1Hj6oU+aSPlMEDwY+PZ+CQoHGzQ4E8Ixk1
	T+lz8C1RTxm7yR01oGm98lbJDCfoR9gNUyfvtmTQfyNqgKGP6NXD0QRxDu49cpezpwVR
	Iirw==
X-Received: by 10.236.140.65 with SMTP id d41mr6362927yhj.113.1357510389141;
	Sun, 06 Jan 2013 14:13:09 -0800 (PST)
Received: from localhost.localdomain ([187.23.158.26])
	by mx.google.com with ESMTPS id x9sm64284375yhl.17.2013.01.06.14.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 14:13:08 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 20:12:57 -0200
Message-Id: <1357510379-14744-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-browser][PATCH 1/3] scripts/firefox-gen-l10n-recipes: Update copyright to 2013
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
X-List-Received-Date: Sun, 06 Jan 2013 22:28:24 -0000
X-List-Received-Date: Sun, 06 Jan 2013 22:28:24 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/firefox-gen-l10n-recipes |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/firefox-gen-l10n-recipes b/scripts/firefox-gen-l10n-recipes
index 65126a2..c1378df 100755
--- a/scripts/firefox-gen-l10n-recipes
+++ b/scripts/firefox-gen-l10n-recipes
@@ -21,7 +21,7 @@ for f in $TMPDIR/*.xpi; do
 	lang_code=$(echo $f | sed "s,$TMPDIR/\([^\.]*\).xpi,\1,g" | tr '[A-Z]' '[a-z]')
 
 cat > firefox-l10n-${lang_code}_$1.bb <<EOF
-# Copyright (C) 2009-2012, O.S. Systems Software Ltda. All Rights Reserved
+# Copyright (C) 2009-2013, O.S. Systems Software Ltda. All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 
 require firefox-l10n.inc
-- 
1.7.2.5



