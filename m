Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOx6U-0001V2-2N
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 15:26:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l27EQqsd017250
	for <openembedded-devel@openembedded.org>; Wed, 7 Mar 2007 14:26:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16740-08 for <openembedded-devel@openembedded.org>;
	Wed,  7 Mar 2007 14:26:49 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l27EQmGm017242
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 7 Mar 2007 14:26:48 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200703071217.31968.christopher.lang@plus.cablesurf.de>
References: <1173131731.5842.140.camel@localhost.localdomain>
	<200703071217.31968.christopher.lang@plus.cablesurf.de>
Date: Wed, 07 Mar 2007 14:26:48 +0000
Message-Id: <1173277608.5826.15.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Bitbake Request for Testing of bitbake 1.8
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
X-List-Received-Date: Wed, 07 Mar 2007 14:26:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2007-03-07 at 12:17 +0100, Christopher Lang wrote:
> Richard,
> 
> I did some tests with bb 1.8 and with same setup with 1.66.
> 
> 1.66 works, 1.8 fails.
> 
> results in: http://bugs.openembedded.org/show_bug.cgi?id=1944

Sorry for the delay in getting to this, I had seen it and have now
committed a fix for the traceback. See the bug report but if you are
having dependency issues afterwards, please follow up this thread with
them, at least initially.

Thanks,

Richard



