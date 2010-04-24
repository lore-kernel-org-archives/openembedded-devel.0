Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1O5nie-0006BC-DZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 00:21:01 +0200
Received: by fg-out-1718.google.com with SMTP id e12so885921fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Apr 2010 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=tTbqPaBHLS5xH0BUZZrF1d6bbcQ10cDCjcocI0b4l6U=;
	b=GgkGRY8oMMUmg1WCWAjSrnJjj1uoJz+roonXRbTxxiTfIh5EulYR8PGeTOv8KN2lH/
	1EDU0cyQqjrH/MBL52gDXfrl2wudHx05fB7E8X8H9Vu7fFWaGIoHykHIedHVvtmcNwud
	/mcHvgyCs7LT0afIuUpfYF2hlijbevA8fjXWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=E4vnuxCKhFsAW8SwmN6sofFRTjoFQRcxm1ZrQ3DufreYqzYkrXtN2ZZXcEFaRpxWgA
	+vf+MteFjg0MgXs7lfRgwg7ccw2JorRsSWPW0xRz5eJAgs7nrbxbPB6dCCOxf4qq6WXh
	6DDfzP3em62Vp7oFe6c1/a22ttwyzmfSCUglY=
Received: by 10.87.74.15 with SMTP id b15mr421976fgl.11.1272147444872;
	Sat, 24 Apr 2010 15:17:24 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id e11sm1803131fga.23.2010.04.24.15.17.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 24 Apr 2010 15:17:24 -0700 (PDT)
From: =?utf-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Apr 2010 00:16:55 +0200
Message-Id: <1272147418-31196-1-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC][PATCH] Topas910 kernel upgrade to 2.6.32 and initial u-boot support
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
X-List-Received-Date: Sat, 24 Apr 2010 22:21:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi oe list.

I've attached patches for the topas910 machine. Please let me know your comments.

Best regards
Matthias




