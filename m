Received: from fg-out-1718.google.com ([72.14.220.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OL0c9-00032h-Rn
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 23:09:10 +0200
Received: by fg-out-1718.google.com with SMTP id d23so812804fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 14:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=SgnujjCAgaBhXuJFmrIT6gJ4rjLcTaVAH0UBTdeYuEE=;
	b=gKU4hG1P6YDU9R6Soj+k8L4mcMyfqiv3BaeoV7/TtWACV1fBlfWC+iOcRCqNPEGHBe
	SfGL7uem1hKjNt8miDZSiA1i8a4u8jZNl+Pgyyg84fzSVg74fs3pc5/BoBqTasWmaB22
	F3wG5sj0dHPFbc0/Vfh3383oB3ckHkYvoCYdY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=N94e+inT4yESMkIy6lkwhFK1dAOgwq6Ll1y7yZHm1IrJ4/YJSbjADnCN1YWLG7B26/
	vFQsAkNQyqPd02+8zjhg1UxdUGV8WjGGkNdgHz14KXuYDaUMh6u0tFezc7D0FgMBRfgA
	d8tRu7B/kE5qa4bMV6yGagr1TWG9nDtOkRwpA=
Received: by 10.87.47.17 with SMTP id z17mr19861648fgj.39.1275771893624;
	Sat, 05 Jun 2010 14:04:53 -0700 (PDT)
Received: from localhost.localdomain (z0701.wist.uni-linz.ac.at
	[193.171.42.194])
	by mx.google.com with ESMTPS id 9sm3782882fks.26.2010.06.05.14.04.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 14:04:53 -0700 (PDT)
From: =?UTF-8?q?Matthias=20G=C3=BCnther?= <matgnt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 Jun 2010 23:04:29 +0200
Message-Id: <1275771871-5163-1-git-send-email-matgnt@gmail.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 72.14.220.159
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt4: Add 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 21:09:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello.

As announced earlier, here are the qt4 patches. The build works well with the latest OE.

Regards,
Matthias



