Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LNXYD-0007D2-Aj
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 20:06:46 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LNXRj-0004hq-EV
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 19:00:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 19:00:03 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 19:00:03 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 15 Jan 2009 19:58:40 +0100
Message-ID: <gko110$hqq$1@ger.gmane.org>
References: <gkn9vn$mh4$1@ger.gmane.org> <20090115172526.GD15943@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090109 Shredder/3.0b2pre
In-Reply-To: <20090115172526.GD15943@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Overlay hosting and mirroring on git.oe.net
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
X-List-Received-Date: Thu, 15 Jan 2009 19:06:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-09 18:25, Denys Dmytriyenko wrote:
> On Thu, Jan 15, 2009 at 01:25:27PM +0100, Koen Kooi wrote:
>> Hi,
>>
>> There are a lot of OE based projects around that use an overlay to manage
>> their tweaks (e.g. gumstix, openpandora, arago), which has pros and cons. A
>> while ago I was talking to John Willis (of open2x and openpandora fame) and
>> he liked the idea of mirroring the pandora overlay on git.oe.net to make it
>> more visible and to make it easier for OE developers to work on making
>> pieces of it upstream safe.
>> I think a git mirror of poky would fall in this category as well.
>>
>> What do you think of this?
>
> Will those be read-only mirrors or read-writeable branches/forks?

That'd be for the overlay owner(s) to decide.

regards,

Koen




