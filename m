Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhSsU-0000Kd-M0
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 21:19:06 +0100
Received: by qyk8 with SMTP id 8so3213770qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 12:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=+2cI5DD5eVl/h4uDque6YF85STRXrOAvv37O1Lkl6iM=;
	b=ciHvP4/moLQDNxENBH2XoCOy5azw5V+VpRm1L57f6AS5YFCGzG0fWs7tBaRAdqx+gH
	vxxEzAxQc2JfBw9r2nBKF/JuRJzo6igUFV73AlwpvfWiDWw5bLb2/RzUYoIAVkZYlJGT
	Avbd6TJK1sOGkCNgbqFGiP5GN3Wae+Z6x09rE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=egIJcBOQlrAW8X8sxrH4n+5ZZQiALsfoz7Rx+vtq6CgvbBQGrbMsniEZzIo1t9LerY
	RBfWWrLYa7dOu83olSxzLSazK4EZmQPQLPvUffEyMmY56pXab7opdkC6mvc6iPhdnJlT
	tUrtWjUtduO6n+OjzqpBZb0n56j59rRNYnOdI=
Received: by 10.229.229.18 with SMTP id jg18mr4100505qcb.276.1295900292911;
	Mon, 24 Jan 2011 12:18:12 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t7sm9616474qcs.28.2011.01.24.12.18.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 12:18:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 12:18:08 -0800
Message-Id: <1295900293-25470-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Replace ipkg-utils with opkg-utils
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
X-List-Received-Date: Mon, 24 Jan 2011 20:19:06 -0000

From: Khem Raj <raj.khem@gmail.com>                                                                  

These patches replace usage of ipkg-utils with opkg-utils
in OE. I have built a native-sdk-image successfully on
angstrom-2008.1

Please review and provide your feedback

-Khem


