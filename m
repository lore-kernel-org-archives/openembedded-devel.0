Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5LSw-0003Ww-39
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 17:06:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5LM7-0000s6-6I
	for openembedded-devel@openembedded.org; Sat, 16 May 2009 14:59:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 14:59:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 16 May 2009 14:59:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 16 May 2009 16:59:08 +0200
Message-ID: <gumkbs$kil$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>	<gulv2v$l9r$1@ger.gmane.org>
	<gumflk$t6s$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <gumflk$t6s$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: what not to do in a recipe
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
X-List-Received-Date: Sat, 16 May 2009 15:06:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-05-09 15:38, Rolf Leggewie wrote:
> Koen Kooi wrote:
>> And it can't be said enough:
>>
>> NEVER use rdepends to drag in kernelmodules, use rrecommends instead
>
> Thank you for pointing this out. I was unaware of it and thought it
> would be a good idea to document such common mistakes in the wiki.
>
> http://wiki.openembedded.net/index.php/Common_mistakes_in_a_recipe
>
> Please add any other FMM (frequently made mistake). To keep the list
> readable, let's focus on mistakes that lead to serious problems.

Thanks!

regards,

Koen



