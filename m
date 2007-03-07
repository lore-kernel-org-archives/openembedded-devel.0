Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOsKQ-00058J-69
	for openembedded-devel@openembedded.org; Wed, 07 Mar 2007 10:20:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l279KqcL017818;
	Wed, 7 Mar 2007 09:20:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17534-03-2; Wed,  7 Mar 2007 09:20:49 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l279Kj9K017800
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 7 Mar 2007 09:20:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20070306041502.GA542@thegnar.org>
References: <1173131731.5842.140.camel@localhost.localdomain>
	<20070306041502.GA542@thegnar.org>
Date: Wed, 07 Mar 2007 09:20:43 +0000
Message-Id: <1173259243.5826.0.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
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
X-List-Received-Date: Wed, 07 Mar 2007 09:21:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-03-05 at 20:15 -0800, Mark Gross wrote:
> FYI 1.8 built my modified slugos-image without any problems.  
> 
> E Build Configuration:
> BB_VERSION     = "1.7.999"
> OE_REVISION    = "f1ac1dc451ca12e3634137ddce1c0caf04f46ee9"
> TARGET_ARCH    = "armeb"
> TARGET_OS      = "linux"
> MACHINE        = "nslu2be"
> DISTRO         = "slugos"
> DISTRO_VERSION = "4.3-beta"
> TARGET_FPU     = "soft"
> 
> 
> Are there special configurations or settings you would like to see
> tried?

Not specifically, I'm mainly after people to test their normal use cases
which it looks like you've done.

Thanks for testing!

Cheers,

Richard



