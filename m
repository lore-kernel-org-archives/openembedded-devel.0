Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LMURb-00034z-CD
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 22:35:36 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LMULM-0002op-Vs
	for openembedded-devel@openembedded.org; Mon, 12 Jan 2009 21:29:09 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 12 Jan 2009 21:29:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 12 Jan 2009 21:29:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 12 Jan 2009 22:28:58 +0100
Message-ID: <gkgcmq$red$1@ger.gmane.org>
References: <f96d234e0901120802m7d4bbe48pb98a08cf04434c2e@mail.gmail.com>	<20090112200403.GB3342@smtp.west.cox.net>	<9AB0D1BC-C8E5-49AF-9841-8563DC76CC9B@student.utwente.nl>
	<20090112204107.GD3342@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081230 Shredder/3.0b2pre
In-Reply-To: <20090112204107.GD3342@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: OE weekly changelog 2009-01-05 to 2009-01-12
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
X-List-Received-Date: Mon, 12 Jan 2009 21:35:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-01-09 21:41, Tom Rini wrote:
> On Mon, Jan 12, 2009 at 09:08:01PM +0100, Koen Kooi wrote:
>> Op 12 jan 2009, om 21:04 heeft Tom Rini het volgende geschreven:
>>
>>> On Mon, Jan 12, 2009 at 11:02:34AM -0500, Cliff Brake wrote:
>>> [snip]
>>>> Koen Kooi (57):
>>> [snip]
>>>>       mtd-utils: add 1.2.0+git for ubifs-support
>>>>       mtd-utils: package *all* ubifs utils
>>> Anything in particular holding back on a -native version too?
>> Nothing apart from a bit of testing :)
>
> OK.  I just checked my stuff and there wasn't anything special for the
> -native one.  I haven't pushed yet as I did my building vs
> e2fsprogs-1.38 (and made it stage uuid) and I can't quite get a build
> ready to test using -1.35 as quick as you could :)

It's using e2fsprogs-libs, which stages that header[1].

regards,

Koen

[1] I'm puzzled why we have both e2fsprogs.bb and e2fsprogs-libs.bb



