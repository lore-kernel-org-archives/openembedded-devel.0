Received: from aek116.rev.netart.pl ([77.55.114.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mateusz.nowaczyk@wisene.pl>) id 1T6mJg-0003Da-UU
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Aug 2012 19:44:38 +0200
Received: from [192.168.0.4] (unknown [79.191.180.77])
	by wisene.nazwa.pl (Postfix) with ESMTP id 514A42A28365
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Aug 2012 19:25:03 +0200 (CEST)
Message-ID: <503E506E.2010002@wisene.pl>
Date: Wed, 29 Aug 2012 19:25:02 +0200
From: Mateusz Nowaczyk <mateusz.nowaczyk@wisene.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Newbie question: Angstrom on at91sam9g20
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
X-List-Received-Date: Wed, 29 Aug 2012 17:44:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I've been using Angstrom 2011.03 (oe-classic) on a modified 
at91sam9g20ek board. Unfortunately, it seems that it is no longer 
updated - it contains obsolete version of dropbear (0.52) ect.
I tried switching to the new oe-core based version, but it lacks 
adequate bsp layer.
I also tried manually changing the opkg.conf and installing packages 
from 
http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv5te/base/ 
but it only caused more problems (can't login at all).
How can i get an up-to-date Angstrom for this architecture? Should I 
stick to the classic OE and manually update recipies, or rather create a 
bsp layer?


