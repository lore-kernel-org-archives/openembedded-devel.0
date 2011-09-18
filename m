Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5FYb-0004Ik-Ez
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 13:29:09 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so3592464fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Xecq27ShBQr/IHlUJc4MrglPRkpQNP03Yxd7GwtJzCs=;
	b=pVg2+1slHJTV6obj7dP+3DgbrHxVvEOHBei+Qv8sgziNOYzt+5ILsPHeIRpMaIRzPP
	aV+gDFPs40rpxuTJAATSSWdyAP1JYeeRdWSRrrmx+BfpksoYPrt9TWg91EJT0jxqAHyp
	EHydxSFYnYXp1R3HgWYmW9watbgR7Z7qnm25g=
Received: by 10.223.37.68 with SMTP id w4mr1422751fad.49.1316345036896;
	Sun, 18 Sep 2011 04:23:56 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id a1sm17912393fab.4.2011.09.18.04.23.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 04:23:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Sep 2011 15:23:19 +0400
Message-Id: <1316344999-26642-18-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
References: <1316344999-26642-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-opie 17/17] opie-icon-reload: for completeness add git version
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
X-List-Received-Date: Sun, 18 Sep 2011 11:29:10 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../opie-icon-reload/opie-icon-reload_git.bb       |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 recipes-opie/opie-icon-reload/opie-icon-reload_git.bb

diff --git a/recipes-opie/opie-icon-reload/opie-icon-reload_git.bb b/recipes-opie/opie-icon-reload/opie-icon-reload_git.bb
new file mode 100644
index 0000000..90f40fe
--- /dev/null
+++ b/recipes-opie/opie-icon-reload/opie-icon-reload_git.bb
@@ -0,0 +1,3 @@
+require ${PN}.inc
+
+PV = "${OPIE_GIT_PV}"
-- 
1.7.2.5



