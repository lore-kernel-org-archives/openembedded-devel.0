Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mbb1v-0001w9-Qi for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 16:11:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Mbalv-0006HB-Ah for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 13:55:15 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 13:55:15 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 13:55:15 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 Aug 2009 15:55:02 +0200
Message-ID: <h615vm$15q$1@ger.gmane.org>
References: <4A83BD15.7070006@atmel.com>
	<h60t34$5kl$1@ger.gmane.org>	<4A8402B0.1000308@atmel.com>
	<200908131456.10488.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <200908131456.10488.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 14:11:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-08-09 14:56, Holger Hans Peter Freyther wrote:
> On Thursday 13 August 2009 14:10:24 Ulf Samuelsson wrote:
>
>> Thanks for helping out, but it does not work as expected.
>>
>> I first create a local.conf for the at91sam9261df
>> and bitbake x11-image.
>> Then I do "MACHINE=at91sam9g20dfc bitbake console-image".
>> A console-image is built,but for the at91sam9261df,
>> which is stored in "tmp/deploy/glibc/images/at91sam9261df"
>>
>> The bitbake does not generate u-boot/kernel or at91bootstrap
>> for the at91sam9260dfc
>
> Stupid question. The task that should pull in u-boot/kernel or at91bootstrap
> is not machine specific?

Hey, you spoilt the punchline to my teach-a-man-to-fish routine :)




