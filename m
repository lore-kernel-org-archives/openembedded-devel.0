Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SzplA-0003Mh-PZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:16 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=J3VTXftGx+qGg9e11KvE52cKVHAxvCOULpvGWijKREI=;
	b=dsO61MkOqMNRkaP5U3gcsxygHzodyVJnS97IIfoNDL7AaFH7UMCdNPzIKlxu3dErKd
	USBSBQzYHfQBjMLe8LDLEnEFw+37B0sKe+j/jZhS/XV9cyvOlaAFfdokAifr3YIjMWer
	M/xpHi1wg5u+LUTsj4KLiT8n3pwQePvmroMJihn0H/duZZKDLjyWzhk4vO6m8BUICFc3
	w9KzsHT8vWjF0a9xUXSv2RBUa1zF4rBnQe3chgnsEC8HeWu8y0Kchd0az8WsPGVS27K2
	8as3zlwyf+Vm19jWW1CxKeOzAqoUhRw1P8ZfOnfQ5monrUgz3KNo7SGt3HJ0tRhpDeBK
	vLGA==
Received: by 10.180.104.200 with SMTP id gg8mr6217457wib.14.1344606509372;
	Fri, 10 Aug 2012 06:48:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm7855553wiy.3.2012.08.10.06.48.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:48:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:30 +0200
Message-Id: <361295f543b8effdc0808f65497cec2b699257eb.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 35/46] e-base: bump EFL_SRCREV
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 990ce5a..1ee7ca8 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "74702"
+EFL_SRCREV ?= "74879"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.6



