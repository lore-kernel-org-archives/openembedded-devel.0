Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MGyfU-00012N-4S
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 19:11:24 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MGyVN-0005VR-NT
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 17:00:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 17:00:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 17:00:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 17 Jun 2009 19:00:43 +0200
Message-ID: <h1b7fr$qjo$1@ger.gmane.org>
References: <1245248446.15129.1.camel@mill.internal.reciva.com>	<h1b0c2$va$1@ger.gmane.org>
	<1245251936.15129.7.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090604 Shredder/3.0b3pre
In-Reply-To: <1245251936.15129.7.camel@mill.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: rfc: delete flow-lossage.bbclass
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
X-List-Received-Date: Wed, 17 Jun 2009 17:11:24 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-06-09 17:18, Phil Blundell wrote:
> On Wed, 2009-06-17 at 16:59 +0200, Koen Kooi wrote:
>> On 17-06-09 16:20, Phil Blundell wrote:
>>> I think this class has probably outlived its usefulness and I propose to
>>> delete it.  Any objections?
>>
>> There are still recipes using it, are you going to fix those as well?
>
> Depends what you mean by "fix".  I would remove "inherit flow-lossage"
> from the recipes in question, obviously, but I don't plan to do any more
> than that.

You are sure nobody is using gcc 3.4 in OE anymore?



