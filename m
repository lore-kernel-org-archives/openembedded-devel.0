Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <stefano.regno@spesonline.com>) id 1JLzne-0007Qh-HG
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 12:47:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id D21E795B41
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2008 12:47:56 +0100 (CET)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 16326-01-2 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2008 12:47:56 +0100 (CET)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id B514D95B35
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2008 12:47:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 8FA6E1D944D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2008 12:47:56 +0100 (CET)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 19717-01-7 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2008 12:47:56 +0100 (CET)
Received: from [192.168.1.163]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 5494A1D71E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Feb 2008 12:47:56 +0100 (CET)
Message-ID: <47A6FB6B.2010106@spesonline.com>
Date: Mon, 04 Feb 2008 12:47:55 +0100
From: ohviey1 <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: Problem with Kermit
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
X-List-Received-Date: Mon, 04 Feb 2008 11:47:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

After listen how configure kermit i have found this problem:

I have Ubuntu with  2.6.22-14-generic #1 SMP Tue Dec 18 08:02:57 UTC 
2007 i686 GNU/Linux
i try to configure kermit but when i try to assing an ip to my usb0 i 
have this error:

stefano@stefano:~$ sudo ifconfig usb0 192.168.1.1
SIOCSIFADDR: No such device
usb0: ERROR while getting interface flags: No such device

with ifconfig -a i don't find usb0.

Sameone could help me?

Stefano


