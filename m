Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LRtu6-0004of-9m
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 20:47:41 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LRtmo-0004dg-1g
	for openembedded-devel@openembedded.org; Tue, 27 Jan 2009 19:39:50 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 19:39:50 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 27 Jan 2009 19:39:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Jan 2009 20:39:40 +0100
Message-ID: <glnnts$5ef$1@ger.gmane.org>
References: <20090127112728.GA14725@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <20090127112728.GA14725@excalibur.local>
Sender: news <news@ger.gmane.org>
Subject: Re: Fix for angstrom.inc
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
X-List-Received-Date: Tue, 27 Jan 2009 19:48:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-01-09 12:27, Stefan Schmidt wrote:
> Hello.
>
> As there have been problems before if people touch core angstrom files here is a
> fix that may be interesting to apply.
> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&h=fso/milestone5&id=6d3445928a08ee36950e91274bbe282022c4da1a
>
> The recipes for the openmoko kernel got renamed and the match for OABI compat
> must changed accorndingly.

looks good to me.

regards,

Koen



