Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NDMRo-0008OH-La for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 19:18:39 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NDMQI-00005J-Q1
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Nov 2009 19:17:02 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 19:17:02 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Nov 2009 19:17:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 25 Nov 2009 19:16:33 +0100
Message-ID: <hejsa1$p9i$1@ger.gmane.org>
References: <1258999585-10614-1-git-send-email-ricardo.salveti@openbossa.org>
	<ae9c9a1c0911250924x3ae0a610n3b15b06fee0ad8b7@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <ae9c9a1c0911250924x3ae0a610n3b15b06fee0ad8b7@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCHES] Fixing Mamona-related packages.
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
X-List-Received-Date: Wed, 25 Nov 2009 18:18:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-11-09 18:24, Ricardo Salveti de Araujo wrote:
> Anyone?

I was planning to look at them later this week but...

> Or should I ask for commit access to push the modifications we're
> creating for mamona?

...having commit access won't hurt :)

>
> Cheers,
>
> On Mon, Nov 23, 2009 at 3:06 PM, Ricardo Salveti de Araujo
> <ricardo.salveti@openbossa.org>  wrote:
>> Patches:
>> [PATCH 1/2] mamonaim-e-applet-git: bumping rev, fixing PV and using oe-stylize
>> [PATCH 2/2] mamona-input-methods-git: bumping rev, fixing PV and using oe-stylize
>>
>> Both patches are basically to fix broken Mamona-related packages at current OE. When Rodrigo Vivi started
>> to merge some Mamona commits, he actually got the wrong ones for these recipes, so this basically fix
>> something that didn't actually work.
>>
>> As current Rodrigo Vivi is not working at Mamona and OE anymore (at least not directly related as before),
>> I'm basically maintaining it with Alecrim and Willer, but as none of us have commit access, I'm asking
>> for anyone to please apply both pathes at OE tree.
>>
>> We are currently working at Mamona Overlay and probably until the end of this week I'll submit many other
>> commits for review and merge.
>>
>> Thanks,
>>
>> Ricardo
>>
>>
>
>
>




