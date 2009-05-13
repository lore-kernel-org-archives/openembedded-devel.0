Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M4J2R-00009j-Vj
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 20:18:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M4Ivq-0005Ps-Sz
	for openembedded-devel@openembedded.org; Wed, 13 May 2009 18:11:54 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 18:11:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 13 May 2009 18:11:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 13 May 2009 20:11:39 +0200
Message-ID: <guf2gr$2jd$1@ger.gmane.org>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>	<guen3q$p5u$1@ger.gmane.org>
	<20090513151848.GI7973@smtp.west.cox.net>	<gueuv0$mjh$1@ger.gmane.org>
	<c384c5ea0905131101k6ec8b858lbd335e51c255b5b9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <c384c5ea0905131101k6ec8b858lbd335e51c255b5b9@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 18:18:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-05-09 20:01, Leon Woestenberg wrote:
> Hello,
>
> On Wed, May 13, 2009 at 7:10 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 13-05-09 17:18, Tom Rini wrote:
>>> On Wed, May 13, 2009 at 04:56:58PM +0200, Koen Kooi wrote:
>>>> On 13-05-09 16:46, Marcin Juszkiewicz wrote:
>>>>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>>>> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
>>>
>>> wrt that patch, is there a reason you aren't bumping ppc as well?  As an
>>> old PPC guy, that's always had me perplexed..
>>
>
> Being old and having PPC boards on my desktop spaces as well I
> recently got the same level of perplexity, but there's only myself to
> blame.
>
> I did recently look elsewhere:
> http://www.oselas.com/oselas/toolchain/index_en.html
>
> That OSELAS toolchain shows the following in its support grid:
>
> gcc-4.3.2
> glibc-2.8
> linux-2.6.27
>
> I extracted and built that toolchain. I saw no patches needed for ppc.

The move to a newer glibc is also in the works, but that requires 
testing as well. That will happen next month to give the gcc+binutils 
change enough time to show bugs.

regards,

Koen



