Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UOExX-0000FF-3D
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:18:14 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so775804eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DQS9dRJrcdkRT2/OwX29oBOaUVcQtfilxpoz2AjJup0=;
	b=LiSjTdwpPy4zoOFkl0s6+tnYry30yVMMBWYNUJxwsG4ZTQXUJWlyMcgNa2XPr/QmEi
	zxiv4lsHETz/96L5343Ic5bN/VLS9MgfaR+CHlu7mSYQKQIho23UMwwd1WL2mJy1F4bZ
	sANBHY5qkcYWrcG7I8x8KKNmtH4P0XwtHN4RM5WGx63xM4Dm/ott2JUeAFLoRAM+F98Y
	Pv9XdqRqOvGcbKgvbBMdfFlLi9V1qQPVeMGXDkmYUEgwrNpKtQ1hCGwDSbpB3/wh/u2E
	UjBLTUAqjihotXAcqADEoECnvVJeM9Qar+NnyuVBty2e2+IGBRsSenThLHYQ0ETuRd8x
	v2Lw==
X-Received: by 10.15.21.1 with SMTP id c1mr23195686eeu.36.1365199256274;
	Fri, 05 Apr 2013 15:00:56 -0700 (PDT)
Received: from mizar.localdomain
	(host43-27-dynamic.248-95-r.retail.telecomitalia.it. [95.248.27.43])
	by mx.google.com with ESMTPS id d47sm17772159eem.9.2013.04.05.15.00.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 15:00:55 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:00:31 +0200
Message-Id: <96cd0b9ccb2271531bb918de872870b493d04682.1365198580.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1365198580.git.andrea.adami@gmail.com>
References: <cover.1365198580.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/6] linux-yocto-3.8: remove cruft (to-do about regulators)
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
X-List-Received-Date: Fri, 05 Apr 2013 22:18:16 -0000
X-List-Received-Date: Fri, 05 Apr 2013 22:18:16 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 0 files changed
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.8/REGULATORS

diff --git a/recipes-kernel/linux/linux-yocto-3.8/REGULATORS b/recipes-kernel/linux/linux-yocto-3.8/REGULATORS
deleted file mode 100644
index e69de29..0000000
-- 
1.7.12.4



