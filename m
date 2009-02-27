Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lcx5A-0001Ir-It
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 08:24:28 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lcx1p-0002Po-FS
	for openembedded-devel@openembedded.org; Fri, 27 Feb 2009 07:21:01 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 27 Feb 2009 07:21:01 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 27 Feb 2009 07:21:01 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 27 Feb 2009 08:20:51 +0100
Message-ID: <go848j$1a4$1@ger.gmane.org>
References: <go4amc$h30$1@ger.gmane.org> <go6ah4$cud$1@ger.gmane.org>
	<20090226154007.GZ2172@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <20090226154007.GZ2172@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] update opkg* SRCREV to 201
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
X-List-Received-Date: Fri, 27 Feb 2009 07:24:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-02-09 16:40, Tom Rini wrote:
> On Thu, Feb 26, 2009 at 03:55:32PM +0100, Koen Kooi wrote:
>> On 25-02-09 21:46, Koen Kooi wrote:
>>> Hi,
>>>
>>> I was getting seriously annoyed with the useless error codes opkg was
>>> giving me and Tick pointed me to:
>>>
>>> http://code.google.com/p/opkg/issues/detail?id=6&can=1
>>>
>>> We're at 197 now in OE (with r201 applied as patch). I'd like to get
>>> r199 and r200 in as well, and since I'm lazy I though we'd get r198 in
>>> as well, which means instead of adding a few patches I can just bump up
>>> SRCREV to 201.
>>>
>>> What do you think?
>> Noone is thinking anything?
>
> <sarcasm>  not since I switched to debs</sarcasm>

You still going to get bitten by opkg bugs when using packaged-staging




