Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jf1Bc-0003ax-GS
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 00:07:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RN77qM000407
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 23:07:07 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32658-06 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 23:07:03 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RN6xCX000401
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 23:06:59 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fsgsaq$nqf$1@ger.gmane.org>
References: <1206638249.4514.57.camel@dax.rpnet.com>
	<fsgsaq$nqf$1@ger.gmane.org>
Date: Thu, 27 Mar 2008 23:07:02 +0000
Message-Id: <1206659222.4514.59.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 27 Mar 2008 23:07:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-27 at 20:25 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> 
> | * Adding do_deploy to packaged-staging's knowledge. This is best done
> | with the patch for kernel.bbclass that thesing was been working on. I've
> | made some suggestions for tweaks (looking at the version already in
> | poky) and suggested he commits it after that.
> 
> That patch broke uImage kernels *real bad*, I just pushed a fix for it.
> 
> Proper review on mailinglist first next time?

Well, it was posted for review on the mailing list and I was one of the
few people who actually responded ;-).

but yes, if it broke things thats bad, if we've fixed it great ;-).

Cheers,

Richard



