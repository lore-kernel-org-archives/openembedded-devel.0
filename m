Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q2gKU-0008Uq-U2
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 09:55:43 +0100
Received: by qyk35 with SMTP id 35so5730787qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=8+lY90ALVvv606T4UQEu20IUxWGBJ6BybUJm0JLXRAE=;
	b=YOXArN5PCCCoenP8ohPfuQe7mAIoVQKzydENiY9lFacSHLN+hOz+bOUUH88v/b3YUR
	Jrc9lFskj7MU5zkLMDrc4sAmE2BwnQsoLsGHiqk270ffHLilLEMyk4PeeEv4YQcMiVFb
	meyRUki6zLsA0iEp9oETW0vpO1LU2Lgy/Otq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=BVFz6FkRZwYu4EUJFkdyRh4V9qiSe4ZSTNdFj6J1beHmeyuRR6O0TSFR1e5LG7swlX
	RUuu2vYTqAF+i+qF4ZSsYJLSn6pQRE3fvaILpQjO33zL+aHa+M1V3pMGNvhyH6OMGcd5
	Vh+TvRnGP1wiTLRNihhgLBkkyfvDUG4KFntxQ=
MIME-Version: 1.0
Received: by 10.224.200.196 with SMTP id ex4mr6850195qab.5.1300956830512; Thu,
	24 Mar 2011 01:53:50 -0700 (PDT)
Received: by 10.224.134.5 with HTTP; Thu, 24 Mar 2011 01:53:50 -0700 (PDT)
Date: Thu, 24 Mar 2011 14:23:50 +0530
Message-ID: <AANLkTikF--Tv-+1EH-E7xxUQ9tEHjK5-j3ysvK6-Ow_F@mail.gmail.com>
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] TI IPC: Add version 1.22.04.25
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
X-List-Received-Date: Thu, 24 Mar 2011 08:55:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-ipc_1.22.04.25.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-ipc_1.22.04.25.bb

diff --git a/recipes/ti/ti-ipc_1.22.04.25.bb b/recipes/ti/ti-ipc_1.22.04.25.bb
new file mode 100644
index 0000000..1573dce
--- /dev/null
+++ b/recipes/ti/ti-ipc_1.22.04.25.bb
@@ -0,0 +1,6 @@
+require ti-ipc.inc
+
+PV = "1_22_04_25"
+
+SRC_URI[ipcbin.md5sum] = "aaa7f3776794a92b4226cd923c7cd956"
+SRC_URI[ipcbin.sha256sum] =
"b33e25e0330719c2857a5ca3abccd03fe1b55a9300b2f825707f2bc64b84c883"
-- 
1.7.0.4


