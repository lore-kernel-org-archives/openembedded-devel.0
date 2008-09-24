Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KiROW-0007J6-Mj
	for openembedded-devel@openembedded.org; Wed, 24 Sep 2008 12:14:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KiRKw-0005qg-UR
	for openembedded-devel@openembedded.org; Wed, 24 Sep 2008 10:11:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 24 Sep 2008 10:11:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 24 Sep 2008 10:11:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 24 Sep 2008 12:11:00 +0200
Message-ID: <gbd3nl$hsb$1@ger.gmane.org>
References: <gb0738$dcq$1@ger.gmane.org>	<200809191645.13840.zecke@selfish.org>
	<gbct33$rh4$1@ger.gmane.org>
	<1222248100.15974.4.camel@ip6-localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
In-Reply-To: <1222248100.15974.4.camel@ip6-localhost>
Sender: news <news@ger.gmane.org>
Subject: Re: Math is hard, but please pay attention to PV
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
X-List-Received-Date: Wed, 24 Sep 2008 10:14:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 24.09.2008, 10:17 +0200 schrieb Koen Kooi:
>> Holger Freyther wrote:
>>> On Friday 19 September 2008 14:48:40 Koen Kooi wrote:
>>>
>>>> Anyway, PE has been bumped, things should work again this the next EFL
>>>> 'upgrade' happens. I just need to find a way to get the past 2 hours of
>>>> my life back.
>>> Thanks!
>> I just fixed linux-openmoko as well, '0' is _less_ than '7', so changing
>> PR from 'r7' to 'r0' is *bad*, I've increased it to 'r8' now.
>
>> Seriously, is math that hard for openmoko people?
>
> Much less the math but rather being used to reset PR on version updates.
> Alas this breaks with hash-based SCMs. I begin to regret the decision to
> use git in my projects.

What I'm wondering (and according to google Rod is wondering the same), 
are you actually testing package upgrades? My gta01 running angstrom 
needs a reimaging almost every time after an upgrade since 
openmoko/fso/efl stuff goes backwards in PV more that it goes forward.
I'm trying to keep[1] FSO up-to-date and working in angstrom, but I'm 
very close on giving up on that.

regards,

Koen

[1] I think I had it working a few months ago



