Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K7R8Q-00082R-J2
	for openembedded-devel@openembedded.org; Sat, 14 Jun 2008 10:29:18 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K7R88-0002pL-VP
	for openembedded-devel@openembedded.org; Sat, 14 Jun 2008 08:29:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 14 Jun 2008 08:29:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Jun 2008 08:29:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 14 Jun 2008 10:28:53 +0200
Message-ID: <g2vvg5$3hh$1@ger.gmane.org>
References: <20080613225643.86B4D1881B6@amethyst.openembedded.net>
	<20080613231709.GB3606@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <20080613231709.GB3606@cimmeria.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev udev-118: go back in time to udev-115 which seems to work slightly better on some Zaurus models
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
X-List-Received-Date: Sat, 14 Jun 2008 08:29:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Sat, Jun 14, 2008 at 12:56:43AM +0200, mickeyl commit wrote:
>> udev-118: go back in time to udev-115 which seems to work slightly better on some Zaurus models
>> Zaurus models: need to force downgrade, I don't want to raise PE here.
>>
>> # rename "packages/udev/udev-118"
>> #     to "packages/udev/udev-115"
>> #
>> # rename "packages/udev/udev_118.bb"
>> #     to "packages/udev/udev_115.bb"
>> #
>
> Im sorry I have to call for a dissaprove on this one, there is no way
> in hell this is the correct way to deal with a small problem on a couple
> of machines.

Same here, that is absolutely the wrong way to 'fix' the problem.



