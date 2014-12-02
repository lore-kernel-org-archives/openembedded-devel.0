Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 73A5C722C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 00:43:54 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so11942181pdj.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 16:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E+v5hVnn0eT2THFwAoeuMr9sVLp8qlovotVW0YyIGnY=;
	b=kRqsJ4ClX5UZFKgyOcqrZLmUuHyyE82mk0dvP0DeWUh13pnJRdu2xFWjJreOl5zcvO
	Ocrz9XRz5s7EIzuZVDvpDkeoNiq3PsQbxC7c16Z/zDz3gqbSKfNB7vLD1BxBjBPVKmxp
	rk8FQwdXc5QvuaACa2essSvhgj4oaNw6rq15gtFs+5ghyv6vLdd12gdbksW/g+c3IU3m
	AHv4IrQBCidDIbEIZpQUw2a4Ah8Xa+gNzBJq3tGmoNM3TWOxjB/ziR28GogvUg37vowX
	fVi/PBSqJAHumaksDJnJv5iyAMfMbdW6xB7waLQ4u0jmcqJ0NJXnwuJdn0vzNolUzrRP
	HBYA==
X-Received: by 10.66.241.239 with SMTP id wl15mr51722450pac.15.1417481034819; 
	Mon, 01 Dec 2014 16:43:54 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id oz7sm5121813pbb.14.2014.12.01.16.43.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Dec 2014 16:43:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 16:43:48 -0800
Message-Id: <1417481028-26644-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417481028-26644-1-git-send-email-akuster808@gmail.com>
References: <1417481028-26644-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 2/2] Maintainers list: add self for recipes-netkit
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
X-List-Received-Date: Tue, 02 Dec 2014 00:44:01 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 49ced8f..ebabc30 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -29,3 +29,7 @@ COMMON
 M:      Joe MacDonald <joe_macdonald@mentor.com>
 F:      conf
 F:      recipes-*
+
+NETKIT
+M:      Armin Kuster <akuster808@gmail.com> 
+F:      recipes-netkit
-- 
1.9.1


