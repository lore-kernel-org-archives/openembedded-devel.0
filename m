Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3F-0006OE-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:01 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=SvTVLu/B2UZud1Cxksg9R+JeEETk6PFev5tdICyCj+k=;
	b=djRLkKuFSv4C1pY3tVBj3qAfrUAFRjsfY4/7Nk02UR7b3YMn5x6qa6qsnPUNEUtF5g
	zL7ehNOI1t5wmt0QawQM7eDClrSp5sQgs/I8xo3ZabSwDUmCSfSfXd/sXti2l1uZ8jFQ
	0KsYM3ZEqrsDdU1kgwUTCuHyldIZs7TKWxamw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Bo/86PPfk+KrTuSIzxHVVGyAaBrFLmOl+CZBg8vCa6iJNNxVF4Tc5mpRAJlOh+G8oJ
	Pyd1mNRbSuBeB8NaNUal9oKD7AJx0tVvS4XkPwO29yWmbJbdCS33wRGWP46+NrLfWKau
	50E6x5vH8oHeTRyUI3hKyJNRPKekIdntG47m0=
Received: by 10.211.199.13 with SMTP id b13mr6368760ebq.29.1242207618752;
	Wed, 13 May 2009 02:40:18 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm1362148eyz.21.2009.05.13.02.40.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:18 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:01 +0200
Message-Id: <1242207556-15601-23-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 22/37] gpe-su: remove unused entries from checksums.ini
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
X-List-Received-Date: Wed, 13 May 2009 10:12:00 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/checksums.ini |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 395dcd9..9e39c83 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -8882,18 +8882,6 @@ sha256=44278e12358531f588501b2d79bb3a32c69e3cddb243674a414df20e3990f196
 md5=b9abca6437f13c4fc5bbb244738de9ea
 sha256=07c91f5433d7c6c44c54640e9f5b65addedaf0eec5c5705175608404bee6de37
 
-[http://gpe.linuxtogo.org/download/source/gpe-su-0.11.tar.gz]
-md5=557d54b0d55fa5134436e8b4afb1e624
-sha256=2ab8f54d65d1555fe71307a685b1be9b2d0e04f862feb5e2487f54ef140dad2b
-
-[http://gpe.linuxtogo.org/download/source/gpe-su-0.14.tar.gz]
-md5=d7a0b0ac64f60a7cceb77b65d50176e1
-sha256=405a5137e9de5487e942d54cc5ee8edb66c54cec48925ff90368b36e38942536
-
-[http://gpe.linuxtogo.org/download/source/gpe-su-0.15.tar.gz]
-md5=3830c34b4482f892607c3b768e6dc7f3
-sha256=468a61461e0569dc55eca454a5e8676163b6544f0af41241e97479604f029791
-
 [http://gpe.linuxtogo.org/download/source/gpe-su-0.18.tar.gz]
 md5=7e22069a6c59138f8b6e3f9cbc6bb616
 sha256=bf1df54e88dbfa94be7b9f9a4c897635dca1ec56885352d8ebeac99f747b0554
-- 
1.6.1



