Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGASv-00069x-L8
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:16:25 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so923474bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0KKr0w2hpKllnFpOMrlVq85SqNS1MrEfn6dATwAik8Y=;
	b=BCXmPpU4CehcDezrj6lfky8rlwcTdFM80KzZn97P2C8fwCJIKGkdnZ+PUimrhecME+
	pHKMQ8CXCsyAHmFJ5LytNEPDWakeotzuCqnJGYBvLWTH1ynJSNmw40vbetd6jFSTU5GK
	v39MtK4QzY6Wbx96iA10PJXdS/CsOyxjF7lRQ=
Received: by 10.204.149.204 with SMTP id u12mr2004909bkv.39.1318947036240;
	Tue, 18 Oct 2011 07:10:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm2306105bkw.5.2011.10.18.07.10.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 07:10:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 16:10:25 +0200
Message-Id: <359a5968f27008d6fcbaee5137c237bfcabd2579.1318946821.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1318946821.git.Martin.Jansa@gmail.com>
References: <cover.1318946821.git.Martin.Jansa@gmail.com>
Subject: [meta-efl 1/3] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Tue, 18 Oct 2011 14:16:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 8eaabd8..ed08105 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
 # usually tracks svn trunk HEAD
-EFL_SRCREV ?= "63721"
+EFL_SRCREV ?= "64150"
 # revision when 1.0.0 was released, for recipes which don't need rebuild so often
 EFL_SRCREV_1.0.0 ?= "56356"
 
-- 
1.7.7



