Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MTERV-0003wv-Gt
	for openembedded-devel@openembedded.org; Tue, 21 Jul 2009 14:27:42 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MTEDu-0006o4-LR
	for openembedded-devel@openembedded.org; Tue, 21 Jul 2009 12:13:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Jul 2009 12:13:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Jul 2009 12:13:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Jul 2009 14:13:18 +0200
Message-ID: <h44bcv$c1v$1@ger.gmane.org>
References: <4A657D58.4070404@atmel.com> <4A659AA1.2000300@kernelconcepts.de>
	<h449ra$6kp$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <h449ra$6kp$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] hal-0.5.12 requires blkid >= 1.43
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
X-List-Received-Date: Tue, 21 Jul 2009 12:27:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-07-09 13:46, Koen Kooi wrote:
> On 21-07-09 12:38, Florian Boor wrote:
>> Hi,
>>
>> Ulf Samuelsson schrieb:
>>
>>> Comments?
>>
>> even if it looks strange... I agree. Very unlikely that the hal
>> maintainers
>> meant to depend on a future release of e2fsprogs.
>
> The util-linux-ng people made it go backwards when moving it from
> e2fsprogs to util-linux-ng. Upstream error, but relatively harmless as
> the resuling package gets 2.16 as PV.

I am confused, ignore me



