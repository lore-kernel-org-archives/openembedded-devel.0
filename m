Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMI-00057w-AV
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:30 +0100
Received: by pwi8 with SMTP id 8so11200pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=+N5Y5wRTdSSOdyFG+k1ZBh8fvQkSP/mNp0ppc4985jA=;
	b=Xw1w+FVljggPpM6S3e5mZe1Ie7x7XpAw0e1mimOn91b+QqLCF8dtke/UKvvYz7VHdq
	uVHjUflniOovPoJNfXgGNoe7iZboSj1RmLVW6yHnCIfQ92ki8TQEsN4tRKWAJwsuNLGy
	TnL4RuQypYWkVmyAA/aDgL1IGzVPiuIdO9Wxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=Ya4ugLM15w1YWW6AczcrA+G5Pf2ITn+s8Jmj85QR/GLyMi8UVzc3vlSKHWrUvR5lq4
	dNBLnMReXhKsChoDrmBjurRvWyYJQDYB22wK6rGnl/0VSBiyr4EWSOZQ1Xp5v73rG6sM
	Lm0X5lDPaI6ba464VyR3RTsYD4ViwEec1xvbs=
Received: by 10.142.207.8 with SMTP id e8mr3273968wfg.259.1295936743364;
	Mon, 24 Jan 2011 22:25:43 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.25.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:25:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:36 -0800
Message-Id: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/9 v2] Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:30 -0000

From: Khem Raj <raj.khem@gmail.com>                                                                  

These patches replace usage of ipkg-utils with opkg-utils
in OE. I have built a native-sdk-image successfully on
angstrom-2008.1 and minimal

Please review and provide your feedback

-Khem


