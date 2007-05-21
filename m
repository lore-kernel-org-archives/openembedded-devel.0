Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1HqHBh-0002mT-D8
	for openembedded-devel@openembedded.org; Tue, 22 May 2007 01:21:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4LNKLfw010937;
	Tue, 22 May 2007 00:20:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10648-09; Tue, 22 May 2007 00:20:18 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l4LNKI5l010929
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 22 May 2007 00:20:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org,
	Nils Faerber <nils.faerber@kernelconcepts.de>
In-Reply-To: <465225B7.50900@kernelconcepts.de>
References: <465225B7.50900@kernelconcepts.de>
Date: Tue, 22 May 2007 00:20:19 +0100
Message-Id: <1179789619.5849.59.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Problem wt. perl-native building for PXA
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
X-List-Received-Date: Mon, 21 May 2007 23:21:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2007-05-22 at 01:05 +0200, Nils Faerber wrote:
> I am encountering a strange problem while trying to build Angstrom for
> PXA (for LinuxTag demo purposes). While we have some other machines
> building it with the same version of OE and Bitbake just fine it fails
> on my notebook (but I would like to be able to rebuild it directly at
> LinuxTag, thus the question).
> My machine has Ubuntu feisty installed. I am using Bitbake 1.8 from SVN
> and an OE checkout from today.
> 
> What happens is that the build works quite well until it comes to
> perl-native-5.8.8-r7. There it fails with the following error:

I'm not familiar with the error but what does /bin/sh point at?

If its dash, try bash as dash causes no end of headaches.

Cheers,

Richard




