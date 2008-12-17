Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LCsUg-0001ay-Jl
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 10:15:04 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LCsQF-0001rf-SJ
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 09:10:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 09:10:27 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Dec 2008 09:10:27 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Dec 2008 10:10:19 +0100
Message-ID: <giaflr$oj3$1@ger.gmane.org>
References: <20081216224735.F3BC6189331@amethyst.openembedded.net>
	<200812170034.08289.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081205 Shredder/3.0b2pre
In-Reply-To: <200812170034.08289.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : evas: ARM_INSTRUCTION_SET = "arm"
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
X-List-Received-Date: Wed, 17 Dec 2008 09:15:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-12-08 00:34, Michael 'Mickey' Lauer wrote:
> Am Tuesday 16 December 2008 23:47:35 schrieb GIT User account:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 2f94ddc3655eeed0235439beb69cabd9f2d02107
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=2f94ddc3655ee
>> ed0235439beb69cabd9f2d02107
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Tue Dec 16 23:43:51 2008 +0100
>>
>> evas: ARM_INSTRUCTION_SET = "arm"
>
> Just curious... why?

because it fails to build otherwise. The compiler chokes on the 16bit 
engines.

regards,

Koen




