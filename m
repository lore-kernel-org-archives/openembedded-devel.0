Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JLlZC-0005d9-9l
	for openembedded-devel@openembedded.org; Sun, 03 Feb 2008 21:35:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m13Ka2lP030180
	for <openembedded-devel@openembedded.org>; Sun, 3 Feb 2008 20:36:02 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29769-09 for <openembedded-devel@openembedded.org>;
	Sun,  3 Feb 2008 20:35:58 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m13KZsLM030174
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Sun, 3 Feb 2008 20:35:54 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47A1D8D4.9010009@spesonline.com>
References: <47A1D8D4.9010009@spesonline.com>
Date: Sun, 03 Feb 2008 20:35:53 +0000
Message-Id: <1202070953.4596.10.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Big Problem
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
X-List-Received-Date: Sun, 03 Feb 2008 20:35:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-01-31 at 15:19 +0100, ohviey1 wrote:
> When i try to cross compile with an elf toolchain i have this error:
> 
> arm-elf-ld: no machine record defined
> 
> Sameone could help me?

Based on that information, almost certainly not. There is no description
of what you're actually doing, the single error message line is near
enough useless.

Assuming there are not two people with this problem, you've already been
told the problem is due to incorrect setup in your kernel defconfig (no
machines are enabled).

Regards,

Richard



