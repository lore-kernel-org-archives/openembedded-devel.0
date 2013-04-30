Received: from mail-da0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDoe-0001I0-Nb
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:54:13 +0200
Received: by mail-da0-f51.google.com with SMTP id g27so315873dan.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=B8N7YY5vp12THmWvnn0tKpg6RqeQA9o1AOgp98IybXg=;
	b=AvOTrDCPCn66OSUER/qnpGkpHeEkDw4quavm/cBOZh6ChH3cXnWtoSZhoDFPQAcEdv
	rxcAvABaTOUg9NvcCa2DEu1KmCUxh+sJSxBZlEuGSXIb9HCnU4TBCInEtxLeVCmud8Ml
	zD+Lt5mfQpnhySdhr0rwzKdtst4muQaRd2EDtCqm20a7yTdmf5LcCowMJMID3cKnTzhF
	JjhAb9nG3B7+kp2BZw1DS1EAuL/FuoB1HWYZS28Hw4ZH4JNuAf8RkQl1s1YRnLYBrr17
	gKpet/MfW9b+O238s02LyO27PwFrDeDeBzBHAiB2peSPzRReCgL9ndrXnDjDWC9FAfrv
	KcVA==
X-Received: by 10.68.195.103 with SMTP id id7mr76570107pbc.56.1367339741283;
	Tue, 30 Apr 2013 09:35:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	xl10sm31255335pac.15.2013.04.30.09.35.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:35:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:57 +0200
Message-Id: <4a89aaebf23b12ed622c626108cbbbde502964b6.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1367339449.git.Martin.Jansa@gmail.com>
References: <cover.1367339449.git.Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 07/12] meta-gnome: add README file
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
X-List-Received-Date: Tue, 30 Apr 2013 16:54:28 -0000
X-List-Received-Date: Tue, 30 Apr 2013 16:54:28 -0000
X-List-Received-Date: Tue, 30 Apr 2013 16:54:28 -0000
X-List-Received-Date: Tue, 30 Apr 2013 16:54:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/README | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/README

diff --git a/meta-gnome/README b/meta-gnome/README
new file mode 100644
index 0000000..d7b9e7f
--- /dev/null
+++ b/meta-gnome/README
@@ -0,0 +1,15 @@
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: dylan
+revision: HEAD
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: dylan
+revision: HEAD
+
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome][dylan]' in the subject'
+
+When sending single patches, please using something like 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][dylan][PATCH'
+
+Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
-- 
1.8.2.1



