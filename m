Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlHME-0007c4-29
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 10:54:06 +0100
Received: by mail-ey0-f175.google.com with SMTP id o13so522504eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 01:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uGOuRqfprx2kwjQslLdEkpp6dPWoaxFWFWjinCoVgVY=;
	b=H6kcvbp9RzAlqZhsuWZ/0CNwrosOhA3GLEuBsvS91fRv9pZyaGiMZDaQ3YPk12p59Y
	vKXPRTsujGjcvFUluIULDEOmgOR6frAgrXwTHEwShceo0XAxSjHDi7wX+kepg5sp3dg6
	Q0Vb6O6b307w4IlZfsfV8tw3FNlpRJa6C6XrY=
Received: by 10.213.6.208 with SMTP id a16mr1882894eba.74.1326361596621;
	Thu, 12 Jan 2012 01:46:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm17383727eeh.10.2012.01.12.01.46.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 01:46:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 10:46:15 +0100
Message-Id: <0796505f34620059cfed707c33f08b68f346937f.1326361490.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1326361490.git.Martin.Jansa@gmail.com>
References: <cover.1326361490.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 1/7] e-base: bump EFL_SRCREV a bit more
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
X-List-Received-Date: Thu, 12 Jan 2012 09:54:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/classes/e-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/classes/e-base.bbclass b/meta-efl/classes/e-base.bbclass
index 5e3e513..17eddec 100644
--- a/meta-efl/classes/e-base.bbclass
+++ b/meta-efl/classes/e-base.bbclass
@@ -1,6 +1,6 @@
 HOMEPAGE = "http://www.enlightenment.org"
 SRCNAME ?= "${BPN}"
 
-EFL_SRCREV ?= "66238"
+EFL_SRCREV ?= "67071"
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.8.3



