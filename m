Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L1jbn-0000Nf-9p
	for openembedded-devel@openembedded.org; Sun, 16 Nov 2008 16:32:19 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L1jZa-0006L6-8w
	for openembedded-devel@openembedded.org; Sun, 16 Nov 2008 15:30:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 16 Nov 2008 15:30:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 16 Nov 2008 15:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 Nov 2008 16:23:06 +0100
Message-ID: <gfpdsq$6vm$2@ger.gmane.org>
References: <1226433327.4417.10.camel@utx.utx.cz>	<1226442540.29923.0.camel@aquilonia>	<1226475337.4118.32.camel@utx.utx.cz>
	<1226842838.4912.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <1226842838.4912.13.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: glibc LC_COLLATE bug
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
X-List-Received-Date: Sun, 16 Nov 2008 15:32:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-11-08 14:40, Stanislav Brabec wrote:
> Stanislav Brabec wrote:
>> Graeme Gregory wrote:
>>> On Tue, 2008-11-11 at 20:55 +0100, Stanislav Brabec wrote:
>>>
>>>> 3) Add new versions to preferred-om-2008-versions.inc
>>>>
>>> As claws maintainer and OM person please do this version.
>> Well, I naively expected that the latest version will work better.
>
> Updated in OE. claws-mail-3.6.1 should now build and work.

Could split such changes up in more commits in the future? Anyway, nice 
work!

regards,

Koen



