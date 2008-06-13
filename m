Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K79ys-0003rz-Oj
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 16:10:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K79yh-0003vJ-RS
	for openembedded-devel@openembedded.org; Fri, 13 Jun 2008 14:10:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 14:10:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Jun 2008 14:10:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Jun 2008 16:09:55 +0200
Message-ID: <g2tv3m$t5l$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>
	<74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <74d0deb30806130306tf5ca604t7238ab26d715e03@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 13 Jun 2008 14:10:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

pHilipp Zabel wrote:
> On Fri, Jun 13, 2008 at 10:20 AM, Richard Purdie<rpurdie@rpsys.net>  wrote:

>> As always, there is a but. This change is conditional on being able to
>> come up with a sensible commit and review policy for OE.dev. The core
>> team does feel that the metadata quality has dropped over time in some
>> areas and we need to have a better review process. The change to an SCM
>> with good branch support is a vital part of this but not the only part.
>>
>> We've not made any decisions on what the commit/review policy should be,
>> this is open for discussion. We're thinking it may take the form of some
>> kind of kernel style Signed-off-by: tags and a switch to a partially
>> pull based model rather than just push based as we use monotone so more
>> than one developer handles any given change.
>
> Personally, I'd like to see every patch to OE being sent to and
> reviewed on the mailing list.

I'd like to see that every commit has at least 2 SOBs, I care less on 
how they get there. Having the review out in the open should be the end 
goal, though.

> About a pull based model, wouldn't we need something like the kernels'
> subsystem maintainers to share the load? Seeing that there already
> seems to be a serious manpower problem, who would have the time to do
> that?

Not that RP says "*partially* pull based model rather than just push 
based", which means that bigger changes get done on a branch (e.g. 
libtool update, Xorg updates, etc) and get pulled in after a review.

regards,

Koen




