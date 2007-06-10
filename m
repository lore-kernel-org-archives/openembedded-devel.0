Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HxRMH-0007lL-88
	for openembedded-devel@openembedded.org; Sun, 10 Jun 2007 19:37:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5AHYrSe003314;
	Sun, 10 Jun 2007 18:34:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02835-10; Sun, 10 Jun 2007 18:34:47 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l5AHYjKU003293
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 10 Jun 2007 18:34:45 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>
Date: Sun, 10 Jun 2007 18:34:45 +0100
Message-Id: <1181496885.6080.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Bitbake 1.6.8 released!
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
X-List-Received-Date: Sun, 10 Jun 2007 17:37:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Bitbake 1.6.8 has been released.

http://prdownload.berlios.de/bitbake/bitbake-1.6.8.tar.gz

This release is primarily a bugfix release. It contains several bugfixes
and minor improvements over the 1.6.6 release and should be used instead
of 1.6.6 in all cases. The most important fix is related to the
__inherit_cache problems which broke operation with OE.dev when using
the bitbake 1.6.x series. See the Changelog in the release for a more
comprehensive list of changes.

Note that using bitbake 1.6.x is no longer recommended and people should
be using 1.8.x now. OpenEmbedded will soon be switching to the 1.8.x
only.

Cheers,

Richard



