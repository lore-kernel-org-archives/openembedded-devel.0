Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF79D6E8C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:57:16 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 10so12018071ykt.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zjknWfzvtxAfcRTD0qDV0/xC2fMQ8CSBzSTEbo+AoDY=;
	b=dRRdIzApllWE49HH6nrPLaTuV0MXeIx8Qp/TV3sHh4Py3v7qi5+93dgBpEOM8/JpCF
	zcftSEKaBdqh/aO3aHv2sz6z2w0c7235Che8TId1OUoY1ORGAUoG3tggNRCSs5I/lsRg
	EDDNDihNhmAwXPjg7XE73g9HXA9MRRewvOAiaAbU8aBdrpzkJH+j4oAnEh2ui5MLCpMP
	mOQBMvVwlsdNGTmkAfQH22t7Wiv5oZg6xo10DnCUFbHCKh7VRlwbg1vPIRBSs1zVuawn
	ylTacWRJBuSPFob9YNU4w5Tf42hObkGf8yfe5NWfIXYZIlhzEhUs7DpiU1/H35aEqaky
	7fFA==
X-Received: by 10.236.129.198 with SMTP id h46mr35597238yhi.17.1392141437608; 
	Tue, 11 Feb 2014 09:57:17 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id
	b24sm61434799yhl.25.2014.02.11.09.57.08 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 09:57:16 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2014 15:56:24 -0200
Message-Id: <1392141388-25288-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
References: <1392141388-25288-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 1/5] README: Reword the section about github forking
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
X-List-Received-Date: Tue, 11 Feb 2014 17:57:17 -0000

This splits the lines in 80 cols and rework the text a little bit to
easy reading.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 README |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/README b/README
index a5a5812..06335bb 100644
--- a/README
+++ b/README
@@ -18,7 +18,14 @@ Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-qt5]
 When sending single patches, please using something like:
 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-qt5][PATCH'
 
-You are encouraged to fork the mirror on github https://github.com/meta-qt5/meta-qt5/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
+You are encouraged to fork the mirror on github[1] to share your
+patches. This is preferred for patch sets consisting of more than one
+patch. Other services like gitorious, repo.or.cz or self hosted setups
+are of course accepted as well, 'git fetch <remote>' works the same on
+all of them. We recommend github because it is free, easy to use, has
+been proven to be reliable and has a really good web GUI.
+
+1. https://github.com/meta-qt5/meta-qt5/
 
 Main layer maintainers:
   Martin 'JaMa' Jansa <martin.jansa@gmail.com>
-- 
1.7.10.4


