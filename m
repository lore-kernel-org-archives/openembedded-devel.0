Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXecu-0008GE-3R
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 17:41:24 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXebb-0000xH-01
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 16:40:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 16:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Feb 2009 16:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 17:36:06 +0100
Message-ID: <gn1j5m$qc5$2@ger.gmane.org>
References: <200902121727.21796.roman@khimov.ru>
	<c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Thu, 12 Feb 2009 16:41:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-02-09 16:28, Leon Woestenberg wrote:
> Hello,
>
> On Thu, Feb 12, 2009 at 3:27 PM, Roman I Khimov<roman@khimov.ru>  wrote:
>> Hello all.
>>
>> There are severe problems with icecc builds currently in OE. Cross-compiler
>> tarball created wrong, PATH set incorrectly, etc.
>>
> Excellent!
>
> It's probably a little-used class, but if we get it to work more
> robustly, we can make more noise about it.
>
> I will try to do some tests here over the next few weeks with your
> patch, time permitting.

Once icecc works we should have a chat with the suse buildservice 
people. PARALLEL_MAKE = "-j256", here we come :)

regards,

Koen



