Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OnNTm-0004y9-9P
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 05:14:01 +0200
Received: by pxi11 with SMTP id 11so2159161pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 20:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=w6ZMokn8jhC1TY63tY+hAk1pchiNZqasLNtPjr3XtjQ=;
	b=W+B1Fka+7D80SLfpiKcktJSPNb+z4pZLXXpGJNpj+VbH1NLW7gDXmSOeZKDzs3jh55
	noghIXXPdmGQnWQLmPXfNC9n9cLfFJ3gCd+/Cl7cva2r1BsY7Nd6+XvTAHJLTvEAXW3S
	mbAF2G7YVYngi6DyOzPQoEznn47ot4NIBkZaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=aTGn9SmHVFiDUFMX9Ie+5lR7G5p+jVA+3cjMEUhPkBrYPk4GRlBXLoLbPGM6JhHEGH
	4tb5jdw2z1TVn4aOpmyMlajQGXav1Y48TwFTspbQVhQjjLgvlPII3jH0CamN3y7MydZ2
	5ciJo2e4pB+ly/8jBxfgt6WemskwXFDnMXVNQ=
Received: by 10.114.15.18 with SMTP id 18mr5229686wao.182.1282533201309;
	Sun, 22 Aug 2010 20:13:21 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d38sm11586601wam.8.2010.08.22.20.13.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Aug 2010 20:13:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Aug 2010 20:13:08 -0700
Message-Id: <1282533191-11579-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] Add efika MX support to OE
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
X-List-Received-Date: Mon, 23 Aug 2010 03:14:01 -0000

Hi

Following three patches will make OE support Efika MX smart computer.
The kernel and u-boot is used from powerdeveloper.org as all the changes
are not upstream yet.

Thanks

-Khem



