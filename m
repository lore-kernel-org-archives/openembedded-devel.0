Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8C8k-0004hD-HG
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 13:45:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8C16-0000UU-T0
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 11:37:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 11:37:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 11:37:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 May 2009 13:37:12 +0200
Message-ID: <gvbbh9$m3s$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>	<1243095832.4226.105.camel@lenovo.internal.reciva.com>	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>	<gvb066$tov$1@ger.gmane.org>
	<1243157020.4226.124.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <1243157020.4226.124.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 11:45:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-05-09 11:23, Phil Blundell wrote:
>  This seems
> particularly pertinent for the stable branch where, as I understood it,
> intrusive changes were supposed to be avoided.

Wrong, the stable branch can get intrusive changes as well, the only 
prereq is review and testing, which most changes in .dev never get.

> Per my previous email, though, I think there are probably better ways of
> solving the original problem that don't require this kind of global
> variable in the first place, and could at least be made to fail in a
> "safe" way for users who aren't aware of the change.

That's nice and all, but I see no actual patch that implements that, or 
even a proposal with pseudocode. I'm sure there are better ways, but 
till someone actually takes the time to cook up a patch instead of 
handwaving, the situation won't change.



