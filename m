Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MDj9d-00035E-F9
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 20:01:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MDj0R-0002EH-7o
	for openembedded-devel@openembedded.org; Mon, 08 Jun 2009 17:51:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 17:51:35 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Jun 2009 17:51:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Jun 2009 19:51:23 +0200
Message-ID: <h0jj2s$sfp$1@ger.gmane.org>
References: <200906031325.48159.marcin@juszkiewicz.com.pl>	<h05nok$s93$1@ger.gmane.org>
	<200906031359.19249.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <200906031359.19249.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] fix for MACHINE_KERNEL_PR stuff
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
X-List-Received-Date: Mon, 08 Jun 2009 18:01:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03-06-09 13:59, Marcin Juszkiewicz wrote:
> Dnia środa, 3 czerwca 2009 o 13:45:24 Koen Kooi napisał(a):
>> On 03-06-09 13:25, Marcin Juszkiewicz wrote:
>
>>> +    pr = bb.data.getVar('PR', d, True)
>>
>> You're not using 'pr' anywhere in the code you add. Looks fine
>> otherwise, although I haven't tested it.
>
> Thats leftover from older version of patch.

So where's the new version of this patch without cruft?

regards,

koen



