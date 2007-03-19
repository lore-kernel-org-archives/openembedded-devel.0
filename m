Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HTPxL-00050E-Ue
	for openembedded-devel@openembedded.org; Mon, 19 Mar 2007 23:03:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2JM3nDi024910;
	Mon, 19 Mar 2007 22:03:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23876-07; Mon, 19 Mar 2007 22:03:46 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l2JM3i71024900
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 19 Mar 2007 22:03:44 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Mon, 19 Mar 2007 22:03:45 +0000
Message-Id: <1174341825.5824.79.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Bitbake 1.8.0 released!
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
X-List-Received-Date: Mon, 19 Mar 2007 22:03:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

Bitbake 1.8.0 has been released after much development as the 1.7 series
in trunk. 

http://prdownload.berlios.de/bitbake/bitbake-1.8.0.tar.gz

This release contains a rewrite of some of the core components to allow
multithreading and fairly comprehensive restructuring of the code. There
are several bugfixes and it should be a fraction faster too in various
places. See the Changelog in the release for a more comprehensive list
of improvements.

It should be backwards compatible with 1.6.6 and a drop in replacement
but you do need the task dependency information that was added to OE.dev
(most trees have this now except perhaps oz354x).

Thanks to the people who tested the prerelease and to Holger for the
release guide.

Cheers,

Richard




