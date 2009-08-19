Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mdodj-0000St-2A for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 19:07:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MdoN1-0005Mw-90
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 18:50:43 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 18:50:43 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 18:50:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 Aug 2009 18:50:19 +0200
Message-ID: <h6hagb$afd$1@ger.gmane.org>
References: <4A84650F.1080902@linuxbj.com>	<200908140406.00714.holger+oe@freyther.de>	<4A850430.6060809@linuxbj.com>	<4A857D57.4040705@linuxbj.com>	<h63vae$ktr$1@ger.gmane.org>
	<4A8C2914.8090604@linuxbj.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4A8C2914.8090604@linuxbj.com>
Sender: news <news@ger.gmane.org>
Subject: Re: patch for compcache recipe
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
X-List-Received-Date: Wed, 19 Aug 2009 17:08:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Please send it in git format-patch format so we can keep all metadata 
when applying it.

regards,

Koen

On 19-08-09 18:32, Ming Chow 周明 wrote:
> Hi,
>
> Thanks for your kind information.
> I have changed the package version to 0.5+0.6pre3 following the policy
> guideline Rolf showed to me.
>
> Koen Kooi wrote:
>> On 14-08-09 17:05, Ming Chow 周明 wrote:
>>> Signed-off-by: Zhou Ming <chow.ming@linuxbj.com>
>>>
>>> I have renewed the patch looks like:
>>>
>>> - added the checksum entry
>>> - use kernel-module-compcache as the package name which results throwing
>>> out packages like
>>> "kernel-module-compcache_0.6pre3-r41.3_beagleboard.ipk"
>>> - use compcache-utils as the tool package name which looks like
>>> "compcache-utils_0.6pre3-r41.3_beagleboard.ipk"
>>
>> NAK, 0.6pre3 violated the OE versioning policy, you want something
>> like 0.5+0.6pre3
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




