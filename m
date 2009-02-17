Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZL3a-0006Ig-LS
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 09:11:54 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZL1e-00089a-FB
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 08:09:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 08:09:54 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 08:09:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 17 Feb 2009 09:09:43 +0100
Message-ID: <gndrc8$at1$1@ger.gmane.org>
References: <200901120019.45621.mickey@vanille-media.de>	<200901141547.26513.mickey@vanille-media.de>	<gme8cj$ejn$1@ger.gmane.org>
	<gndlrv$sht$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <gndlrv$sht$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: python roadmap
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
X-List-Received-Date: Tue, 17 Feb 2009 08:11:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-02-09 07:35, Vitus Jensen wrote:
> Am Thu, 05 Feb 2009 08:35:31 +0000 schrieb Vitus Jensen:
>
>> Am Wed, 14 Jan 2009 15:47:26 +0100 schrieb Michael 'Mickey' Lauer:
>>
>>> Thanks to some extrashifts this work has proceeded faster than
>>> scheduled. I plan to merge mickey/python26 into master on friday. If
>>> you see something dangerous, yell.
>> Yell ;-)
>>
>> See http://bugs.openembedded.net/show_bug.cgi?id=5013
>>
>> python26 fails to build for the big-endian machines I tried, namely
>> nslu2be.  And as python25 was removed it is a real blocker for packages
>> which DEPEND on pathon, which inturn is the case for php.  And php I'm
>> trying to get a version working again.
> ...
>
> Does anyone build packages for bigendian machines?

yes



