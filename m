Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LYG0M-0004ur-JH
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 09:36:06 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LYFyr-0006sx-5L
	for openembedded-devel@openembedded.org; Sat, 14 Feb 2009 08:34:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 14 Feb 2009 08:34:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Feb 2009 08:34:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 14 Feb 2009 09:34:16 +0100
Message-ID: <gn5vm8$clm$1@ger.gmane.org>
References: <499570E4.1020503@balister.org> <4996379F.50003@whitby.id.au>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <4996379F.50003@whitby.id.au>
Sender: news <news@ger.gmane.org>
Subject: Re: Having trouble keeping track of the Patches?
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
X-List-Received-Date: Sat, 14 Feb 2009 08:36:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-02-09 04:16, Rod Whitby wrote:
> Philip Balister wrote:
>> Patches sent to the list are being tracked with patchwork now:
>>
>> http://patchwork.openembedded.org/project/openembedded/list/
>>
>> If you submit a patch, please update the flags as comments occur and
>> consensus happens.
>
> I've applied patch 22 to oe.dev, and have an account on patchwork - how
> do I update it to identify that it has been applied?

Change the state to 'accepted' and tick the 'archive' box. It looks we 
can define our own set of states, so maybe a 'committed' can be added.

regards,

Koen



