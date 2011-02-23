Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsESm-0000rT-Jx
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:05 +0100
Received: by yie16 with SMTP id 16so3294926yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:subject:date:message-id:x-mailer; 
	bh=qsxPWChxQkGj223jImh3V4evvDukKllSgtCvhhpUIF8=;
	b=JszVAF3NS4ADPfv9z0xvoZMuKDmUI5fEOigMqY4ofccb1vca+BCxYeJU4YNzTMkB1L
	FkT4FkfDJdnU15QiXumF+/DKymiLZ31eCSykwJV8d3BqVWi1gWL27g1m7QSL0OhFWECT
	J1AnOAe7OktBo4iDueNAY6KTUa4NI5efA66Ig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	b=TpqB0PNuO2Zt/3HO0AURGaid4wRdvHZIvBIyYJoCjLQBAA3g95WJ3QRLZk8t11s7RI
	oWc8fAltfGL3jzeO5/aA1UdAhHGM6j5inkuzRoMu7jfnMNjgKMYXxt6VYHMaOHH7Qa1t
	xaEBjimG/W1zD/KDyTsy7M6v02wMNS0WajjmU=
Received: by 10.91.40.16 with SMTP id s16mr17016agj.77.1298466463783;
	Wed, 23 Feb 2011 05:07:43 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:07:43 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:11 +0000
Message-Id: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 00/14] Patchset waiting for merging on O.S. Systems tree
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:05 -0000

Hello,

I am sending the list of 14 patches waiting for merging into master.

They all seem to be working fine and specially the qmake/cmake ones
are important to users of Qt since it makes it work for CMake based
projects and SDK toolchains.

Thanks in advance,



