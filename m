Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrR-0006pJ-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:33 +0200
Received: by mail-gg0-f175.google.com with SMTP id v1so13582ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=aMdzu6efzkEr+qsD4smngGU7XavZioiygw2xpdhyGPU=;
	b=J6ihfqJks2o6usHFBk0EsVKD25RhbiUerdg99LYzPtIwhk5gujMvc6YZbpW+zkocG+
	IECCR7kb9QcTSvzoVkLSJurJvvcvj8mq/sPwDDFHm7nG7Y/MGvxJ6WafEuJlcQaRi+AA
	Ilpi6YX//yswR+YinEzqp7ifnPRPwgQ0lTqo06g/NzbUjhIYsAa75OgTyaWct5uUtZ5D
	B0fDoZr+ZupJt+0ODG6aPNDVMyz2jRP1v3+n28WfBjgiYXoRz6nRFSQfid4WrB4IWoSi
	NBVSsaZtbSAgowoJITDq6pXkIY9KocSasrrWloW8QvJG7sUkXu9h3+BvImUigEPHFlOe
	iBEg==
Received: by 10.101.138.10 with SMTP id q10mr1202569ann.51.1349323415351;
	Wed, 03 Oct 2012 21:03:35 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:08 -0300
Message-Id: <1349323389-16520-9-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 8/9] vlc: bump PR due libav update
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
index 9f53159..6ef0b6b 100644
--- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 
 require vlc.inc
 
-PR = "r1"
+PR = "r2"
 
 # work around build failure
 EXTRA_OECONF += " --enable-libxml2=no"
-- 
1.7.2.5



