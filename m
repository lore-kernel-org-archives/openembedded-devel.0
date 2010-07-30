Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Oeqcs-0000SR-AY
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 16:31:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OeqcT-0003xk-6P from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 07:31:29 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Fri, 30 Jul 2010 07:31:28 -0700
Received: from [172.30.80.28] ([172.30.80.28]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 30 Jul 2010 08:31:28 -0600
Message-ID: <4C52E238.80603@mentor.com>
Date: Fri, 30 Jul 2010 07:31:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280475746-15699-1-git-send-email-raj.khem@gmail.com>
	<i2u4cr$gkg$1@dough.gmane.org>
In-Reply-To: <i2u4cr$gkg$1@dough.gmane.org>
X-OriginalArrivalTime: 30 Jul 2010 14:31:28.0252 (UTC)
	FILETIME=[E56793C0:01CB2FF3]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf, cross.bbclass: Make multi-machine toolchains to co-exist
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
X-List-Received-Date: Fri, 30 Jul 2010 14:31:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 30-07-10 09:42, Khem Raj wrote:
>> From: Tom Rini <tom_rini@mentor.com>
>>
>> the patch Tom sent has line breaks etc. this is same patch formatted for anybody to test
> 
> MACHINE=beagleboard bitbake ffmpeg:
> 
> | running configure fragment for nptl/sysdeps/pthread
> | configure: error: compiler support for __thread is required
> | ERROR: Function do_configure failed
> NOTE: package glibc-initial-2.9-r36.3: task do_configure: Failed

That's odd.  My beagleboard build got to mesa before my laptop hd filled 
up overnight.  I'll try doing just beagle shortly

-- 
Tom Rini
Mentor Graphics Corporation


