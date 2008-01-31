Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1JKaFe-0000W8-Qk
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2008 15:18:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id B24F395B46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 21489-01 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 7D2F295B30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 6A3A11D9450
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 19632-01-8 for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Received: from [192.168.1.163]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 391DA1D944E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 15:18:58 +0100 (CET)
Message-ID: <47A1D8D4.9010009@spesonline.com>
Date: Thu, 31 Jan 2008 15:19:00 +0100
From: ohviey1 <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: Big Problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2008 14:18:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

When i try to cross compile with an elf toolchain i have this error:

arm-elf-ld: no machine record defined

Sameone could help me?


