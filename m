Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OyPSH-0000ro-FY
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 15:33:52 +0200
Received: by bwz2 with SMTP id 2so424177bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Sep 2010 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer;
	bh=WApJysCOoyZGWXWLIJl/M5or++3rl9McHicjADQE2Ak=;
	b=stTiPZpgWXp5ctaPxR45LxEikQFoxxgvp64KbsN6O0fNHL/aD6UyC+nvv4S3yEVI6A
	fYwLeqRZW8+9YpVFuBDS0uj7JZQbbRUefGiABDIJv7hGs1cpbFQ5W8grZ+F5mT67ayPP
	GeBVu1ieu7pt9ZEjQ6GE/h88FcwU1LDQPs4Zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=LurOK/GZeoI+qA4Xh7YH8wOHm66DeiiVSX4/Wjm0NOq9st+oiLOh6M2+vN2CRMTEEr
	BsHoeIeqJCGbAh7cuXXXi5hXYgBLNSVaFB4YiKQPip4PzU+jFh/9SiFLuh07Nb4NW7fQ
	d5SB1X8fMPj0EsgOsrC5S4yeqXec1GuVQz7T8=
Received: by 10.204.112.207 with SMTP id x15mr60828bkp.194.1285162426265;
	Wed, 22 Sep 2010 06:33:46 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id s34sm8582075bkk.1.2010.09.22.06.33.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Sep 2010 06:33:44 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Sep 2010 15:32:55 +0200
Message-Id: <1285162376-13725-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.2.2
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-igep2
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
X-List-Received-Date: Wed, 22 Sep 2010 13:33:52 -0000

The igep team released a new kernel at [1] but did not provide an
updated version of the recipe in oe.

The kernel boots and works fine so far. Acks/naks are welcome.

[1] http://labs.igep.es/index.php/The_Linux_kernel



