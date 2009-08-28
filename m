Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mgx5P-0002KN-QS for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 10:45:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1Mgwno-0004bZ-2c
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Aug 2009 10:27:20 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 10:27:20 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 10:27:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 28 Aug 2009 10:26:56 +0200
Message-ID: <h784ci$6dn$1@ger.gmane.org>
References: <17EB92EC37534805AA9639B72BDB7947@pcvirus>	<h71i51$7na$1@ger.gmane.org>
	<9DACC7DD08D24732B789F4CCFC1145EC@pcvirus>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <9DACC7DD08D24732B789F4CCFC1145EC@pcvirus>
Sender: news <news@ger.gmane.org>
Subject: Re: Recipe for libv4l
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
X-List-Received-Date: Fri, 28 Aug 2009 08:45:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-08-09 22:53, rath wrote:
>
> The existing recipe only includes the V4L Api. But I also want the
> different drivers, which are included in this archiv:
> http://linuxtv.org/hg/~hgoede/libv4l/archive/a1d79882b7eb.tar.bz2

I'd advice building the module in a seperate recipe and not from a 
random hg snapshot.

regards,

Koen

>
>> On 25-08-09 19:40, Rath wrote:
>>> Hi,
>>>
>>> I've tried to write a recipe for libv4l, but I get a file not found
>>> error and the kernel version is identified as 2.6.29 but I have
>>> 2.6.29-omap1.
>>> Here is the recipe: http://pastie.org/592125 and the compile log:
>>> http://pastie.org/592124
>>>
>>> What's wrong with the recipe?
>>
>> Slightly different question: what's wrong the the existing recipe[1]?
>>
>> regards,
>>
>> Koen
>>
>> [1]
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/v4l2apps/libv4l_0.5.8.bb
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>




