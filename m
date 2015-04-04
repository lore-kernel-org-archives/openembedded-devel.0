Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB7E724DC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:24:20 +0000 (UTC)
Received: by pactp5 with SMTP id tp5so149152609pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FRn5S9ju0SWC4fCn/AtU+CUWWAHZBUqPZ6X381ngteg=;
	b=NtkhAUw4Ve56d1tAn3FTSbI72pZLjmH+tzYaJ+NU8WCYFeGp40xpabEYes2bfs8fJF
	BkDK0IJlpVd3/t7ZmMHKg4UQ303t9S9GHaIMhThVVgcCWaQgrbOqL26CN/WYsk1Ln4l4
	EjnMKa5zFG6CV60j9yuYQl/CnyGzg2rfpQTe3hdqzRKmlGR5m3iT/Vmi6/ZQCwoJYi7/
	MzDA3E3RvA74Pz8FGx0lmgz3Ml4g9HlnAaV5lWXo9zPmRdPp7xc5tlpGiRCBKTT2Wl0L
	VRBtTBVm+Up4bMbPAhO3girnTZix5uiQvm5ph3ETTPtg/r0NCy3rSkq4belKX3yTBONI
	1D6A==
X-Received: by 10.66.141.143 with SMTP id ro15mr13736261pab.4.1428164662341;
	Sat, 04 Apr 2015 09:24:22 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id eo1sm6618896pbd.36.2015.04.04.09.24.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 Apr 2015 09:24:21 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Apr 2015 09:24:12 -0700
Message-Id: <c92e632f1362090f4792e6757e014135e64be640.1428164164.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1428164164.git.akuster808@gmail.com>
References: <cover.1428164164.git.akuster808@gmail.com>
In-Reply-To: <cover.1428164164.git.akuster808@gmail.com>
References: <cover.1428164164.git.akuster808@gmail.com>
Subject: [PATCH 2/2] README: update maintainer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Apr 2015 16:24:21 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-ruby/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/README b/meta-ruby/README
index 99cd9bc..08e0aa7 100644
--- a/meta-ruby/README
+++ b/meta-ruby/README
@@ -13,4 +13,4 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ruby
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-ruby][PATCH'
 
-Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
+Layer maintainer: Armin Kuster <akuster808@gmail.com>
-- 
2.3.5


