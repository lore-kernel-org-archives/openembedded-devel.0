Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kimsr-0007wF-GI
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 11:11:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KimpF-0003hJ-Ce
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 09:07:53 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 09:07:53 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 09:07:53 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Sep 2008 11:07:46 +0200
Message-ID: <gbfkd2$6p4$1@ger.gmane.org>
References: <gbfeov$m8g$1@ger.gmane.org>
	<19c1b8a90809250106g64cb04anc69e9dc4165d2139@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <19c1b8a90809250106g64cb04anc69e9dc4165d2139@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: liboil softfloat fix questions
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
X-List-Received-Date: Thu, 25 Sep 2008 09:11:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Sep 25, 2008 at 12:31 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:

>> [2] On cortex-a8 the VFP isn't pipelined, so double precision math is twice
>> as slow compared to ARM11 cores, the NEON unit is pipelined, but can only do
>> single-precision. '
>
> should get better with cortex-a9

Yes, cortex-a9 dumps the vpf-lite and has a proper pipelined version, 
but sadly there isn't any cortex-a9 silicon on the market yet.

regards,

Koen



