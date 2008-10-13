Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KpTJC-0004mL-Ru
	for openembedded-devel@openembedded.org; Mon, 13 Oct 2008 21:42:26 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KpTEH-0004ft-8O
	for openembedded-devel@openembedded.org; Mon, 13 Oct 2008 19:37:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 13 Oct 2008 19:37:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 13 Oct 2008 19:37:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 13 Oct 2008 21:37:13 +0200
Message-ID: <gd0819$jp$1@ger.gmane.org>
References: <200809031554.52267.zecke@selfish.org>	<200810130034.18105.zecke@selfish.org>	<1223854206.5230.6.camel@dax.rpnet.com>
	<200810131852.34080.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <200810131852.34080.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Hash based SCMs and OpenEmbedded/Bitbake
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
X-List-Received-Date: Mon, 13 Oct 2008 19:42:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-2008 18:52, Holger Freyther wrote:
> On Monday 13 October 2008 01:30:06 Richard Purdie wrote:
>> On Mon, 2008-10-13 at 00:34 +0200, Holger Freyther wrote:
>>> On Wednesday 03 September 2008 15:54:52 Holger Freyther wrote:
>>>> Hey guys,
>>> okay, I merged these patches now.
>> Hmm, that will teach me to take my eye off the mailing lists. So we do
>> git checkouts now when parsing?
>
> No, nothing changes. If you want to use git-rev-list (e.g. I want that for the
> openmoko distro) you put BB_GIT_CLONE_FOR_SRCREV=1 into your local.conf.
>
> I think this is a sane default, the next part will be implementing the idea
> from werner.

But we can't actually use all this, since .dev can only depend on 
released versions of bitbake, right?

regards,

Koen



