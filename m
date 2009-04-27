Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LyRgl-0005IR-Lc
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 16:20:08 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LyRbs-0003Ai-BG
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 14:15:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 14:15:04 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 27 Apr 2009 14:15:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 27 Apr 2009 16:14:52 +0200
Message-ID: <gt4ekt$ba2$1@ger.gmane.org>
References: <49F59B68.1010208@balister.org>	<69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
	<20090427134352.GE18788@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090427134352.GE18788@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 14:20:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-04-09 15:43, Tom Rini wrote:
> On Mon, Apr 27, 2009 at 03:37:25PM +0200, Sledz, Steffen wrote:
>>>> At the moment we are not able to make a build out of the
>>>> .dev tree. :(
>>>
>>> For what machine and distro?
>>
>> hipox and angstrom
>>
>> But does this problem really depends on them? I thought it's a problem in the gcc-4.2.4 recipe.
>
> It's in all gcc versions, really.

No, it isn't:

NOTE: package gcc-4.3.3-r0: task do_build: completed

Anyway, isn't ldflags.patch supposed to fix missing ldflags?

regards,

Koen




