Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVj6K-0001cp-CA
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 15:54:22 +0200
Received: by mail-pb0-f41.google.com with SMTP id md12so884555pbc.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=0ohq6PbqempMOkZFUAe51ocvNnGClOnAx5Fsa7cyg64=;
	b=a8KqNMyUkT6poP4Ma++3nozrTmi3zbObWrk94I88Mjm7EoK0c2kUZ3UdW/Gp71yjFy
	5S4RcpfSqM/2iAUvzcVYD2wzZvt990l4HDGDKgtOXVvOQ3T/U53z/FzqrJTJ3K/DRUc6
	BwHK2tMBXg8qYpNLf1BGNnsp/Jl+ynZ3oA+RIkkpsVIPUllC6CprNPhAEh7WIHwX5+AX
	I7FYheJvema7Dj3WBgc9eb1/zOepQ3rrwgXwu/qw6/4KV6v3RPZ8Ay42PcdZ/fxHCoEh
	Qrm8W9zN54Djp/PimSF8M9YywMhsD3JYowiqK4IzOX5zY2kNO0wpSVCA5NxULud22IG9
	nZ+g==
X-Received: by 10.66.187.231 with SMTP id fv7mr47289337pac.46.1366983386774;
	Fri, 26 Apr 2013 06:36:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	li15sm12847780pab.2.2013.04.26.06.36.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 06:36:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Apr 2013 15:36:22 +0200
Message-Id: <1366983384-31049-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
References: <1366983384-31049-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] meta-gnome: add README file
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
X-List-Received-Date: Fri, 26 Apr 2013 13:54:25 -0000

---
 meta-gnome/README | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/README

diff --git a/meta-gnome/README b/meta-gnome/README
new file mode 100644
index 0000000..29a21b7
--- /dev/null
+++ b/meta-gnome/README
@@ -0,0 +1,15 @@
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+URI: git://git.openembedded.org/meta-openembedded
+branch: master
+revision: HEAD
+
+Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-gnome]' in the subject'
+
+When sending single patches, please using something like 'git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-gnome][PATCH'
+
+Interim layer maintainer: Martin Jansa <Martin.Jansa@gmail.com>
-- 
1.8.2.1



