Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eI-0001X9-UN
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:24 +0200
Received: by fxm6 with SMTP id 6so1460553fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=9nCYjmuvPSLINT56EhNlDAr5iP58pvmZX6RlSE8+sdY=;
	b=E7VKi2JwS2Bk1OhrjO9rnFwxZXk9BTR86jZJkOX6kG7aiq19itFreFdU1phNvrVZAT
	rqnZPtKJIplq9aSCcYgRAa8yk8pkYdKZk3uIRvjgwWWI7lH4L858NYnNm9K251MqC4wG
	ZGXr7sqCx/mfdcZo0Sc+ygDeBhXhzFfYCBc78=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I5vhJv0GiV6F10zfm/jOXoU/Oy/MRa74+D0sF1PPbZaBYZKszwp2Puo+wuoaF8thhR
	BXUaIZXV5r99eIAtsrkeNiUVAhQSZ2+9D0Kono1v0K3JDmseEo2tk674Y2J/ItJHJzUQ
	BUEBHV96n0o90cIvpxrCVKhKFGjfihB1l862M=
Received: by 10.103.229.19 with SMTP id g19mr3778178mur.59.1287477228676;
	Tue, 19 Oct 2010 01:33:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n8sm3314995faa.31.2010.10.19.01.33.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:17 +0200
Message-Id: <1287477207-27752-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/13] angstrom/sort.sh: remove om-3d7k as it was canceled long time ago
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/angstrom/sort.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/contrib/angstrom/sort.sh b/contrib/angstrom/sort.sh
index 6308486..f00d87b 100755
--- a/contrib/angstrom/sort.sh
+++ b/contrib/angstrom/sort.sh
@@ -56,7 +56,7 @@ case "$arch" in
 	"armv5teb")
 			machines="fsg3be ixp4xxbe nslu2be" ;;
 	"armv6")
-			machines="bug iphone mx31ads mx31moboard mini6410 nokia800 om-3d7k omap2420h4 omap2430sdp smartq5 smartqv7 smdk6410" ;;
+			machines="bug iphone mx31ads mx31moboard mini6410 nokia800 omap2420h4 omap2430sdp smartq5 smartqv7 smdk6410" ;;
 	"armv6-novfp")
 			machines="htcblackstone htcdiamond htcdream htckaiser htcnike htcpolaris htcraphael htctitan htcvogue" ;;
 	"armv7a")
-- 
1.7.3.1



