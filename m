Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtH-0007XA-NK
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:43 +0200
Received: by gxk3 with SMTP id 3so81584gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=s+qkwGaRln2VvNO8o2RaDtWO4kJBSTJ2MdN0/QS94Ug=;
	b=qIOuEdWSm/PQncOmyfJz8JR16P+C+2hy85jsNtZ9DMr0qtVrlnMw060SaA12a4B8rG
	1GDpxrpueuiIcB10rSAHGNf4M/zCERk/kh/LKWvRnd360VvzQVJ0EzIHlo25U4KoMp4X
	uMeIDGX/9oq7TxjyE+hmwScTyPKy9jcwoBdDw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=om8OanycplqhPHuCpE/T5wNbZxhbCfq01TRArUPn9v9VRSZycVCCKI/fghSfHnk51u
	hUkJZLsUrzy6Cu/M178LzKng8tsar1qjhM+0aLWtdLyCOUellqHo61V7sNv4WScVFYtp
	/MkZ2xA9Ss2FQmme6xUA3whPAuX96u+BpeZeo=
Received: by 10.236.157.8 with SMTP id n8mr9741065yhk.128.1306959392586;
	Wed, 01 Jun 2011 13:16:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:12 +0000
Message-Id: <30a56c60d474717add7adcf9adabd84c7880187c.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/5] freerdp: bump SRCREV to 20110530 snapshot
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index e135902..a5f158a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,9 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-SRCREV = "f5aef3be8fac9a02b0c7bbb5424831a7b285e7bb"
+SRCREV = "dd759622a097474114ce425021ef52d0aa5d3957"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



