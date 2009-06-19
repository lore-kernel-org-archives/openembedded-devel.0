Received: from [17.148.16.87] (helo=asmtpout012.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MHeh4-0005hh-Bg
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Jun 2009 16:03:50 +0200
MIME-version: 1.0
Received: from [87.201.169.51] by asmtp012.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLH0010UNWCY670@asmtp012.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	19 Jun 2009 06:53:09 -0700 (PDT)
Message-id: <F59CC89B-5247-4E2B-B3AA-10BB4578693E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <4A3B9488.6010704@balister.org>
Date: Fri, 19 Jun 2009 17:52:47 +0400
References: <C960916A-B754-4AD4-9751-67D7025AC8C1@mac.com>
	<h19s8q$jd7$1@ger.gmane.org>
	<4593EC5C-D89E-4947-AA92-3AD423A196B5@mac.com>
	<h1dr55$nue$1@ger.gmane.org> <4A3A82F6.1010306@balister.org>
	<h1e06a$9ja$1@ger.gmane.org>
	<332330BB-4014-47FE-9E52-19B485312460@mac.com>
	<4A3B9488.6010704@balister.org>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Patch for libfann-2.0.0 recipe
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
X-List-Received-Date: Fri, 19 Jun 2009 14:03:50 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Cool, thanks Philip! :-)

Elvis

On Jun 19, 2009, at 5:37 PM, Philip Balister wrote:

> Elvis Dowson wrote:
>> Hi Koen,
>> On Jun 18, 2009, at 10:14 PM, Koen Kooi wrote:
>>>
>>> I think the fann authors know best where to install their to,  
>>> which means using autotools_stage_all.
>>>
>> Not really, atleast I'm new to oe, and it took me a while to get to  
>> this stage. I can find my way around a bit now, but I really can't  
>> understand the pros and cons of using PR, INC_PR, etc. Most of the  
>> recipes in oe all use PR anyway.
>> I just pitched in to help Justin out. And thought I'd just submit  
>> the patch back. You may alter it and incorporate it as you see fit.
>
> I committed a recipe in:
>
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=617f8b6d64b7d3f47eb8c8ddd56817e9577f354f
>
> I staged the headers into /usr/include (following Debian, not Redhat/ 
> Fedora). If you have recipes that use fann and are having trouble  
> with this, ask once on the list, and we will try and suggest fixes  
> for the recipes for the cases that expect the headers in <fann/ 
> fann.h>.
>
> Thanks,
>
> Philip
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



