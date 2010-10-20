Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P8dr3-0001CT-FT
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 20:57:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id E8A853149E89
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:57:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aLUYaBIEfGNC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:57:01 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 8CE253149D70
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 20:57:01 +0200 (CEST)
Message-ID: <4CBF3B7D.3010904@opendreambox.org>
Date: Wed, 20 Oct 2010 20:57:01 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286812675-31626-1-git-send-email-chase.maupin@ti.com>	<AANLkTinR7QSaFb1FTzETX9=k9=JZh58iZgyD=7=So1uF@mail.gmail.com>	<131E5DFBE7373E4C8D813795A6AA7F080310FFA2BC@dlee06.ent.ti.com>	<i8vln6$njo$1@dough.gmane.org>	<AANLkTik+qU9YfpoHybY=v87sVGOE9M8RjdKgfgwfL-JF@mail.gmail.com>	<131E5DFBE7373E4C8D813795A6AA7F080310FFA314@dlee06.ent.ti.com>	<20101020181558.GN11514@denix.org>	<131E5DFBE7373E4C8D813795A6AA7F0803110B3388@dlee06.ent.ti.com>
	<20101020183704.GP11514@denix.org>
In-Reply-To: <20101020183704.GP11514@denix.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] recipe licenses: update recipe LICENSE fields
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
X-List-Received-Date: Wed, 20 Oct 2010 18:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/20/2010 08:37 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 20, 2010 at 01:27:54PM -0500, Maupin, Chase wrote:
>>> -----Original Message-----
>>> From: openembedded-devel-bounces@lists.openembedded.org
>>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>>> Denys Dmytriyenko
>>> Sent: Wednesday, October 20, 2010 1:16 PM
>>> To: openembedded-devel@lists.openembedded.org
>>> Subject: Re: [oe] [PATCHv2] recipe licenses: update recipe LICENSE fields
>>>
>>> On Mon, Oct 11, 2010 at 02:53:59PM -0500, Maupin, Chase wrote:
>>>>>
>>>>> I'm not sure if it is a policy. Haven't seen it being pulished as such.
>>>>> Having said that, I have no problems with it (although there is no
>>>>> problem with enforcing patents or so for v2+ , as that still falls
>>>>> under the v2 umbrella).
>>>>>
>>>>> I guess most of our recipes that say GPLv2 are wrong and are v2+.
>>>>> It might be hard to distinguish between these though, it could well be
>>>>> that the license file says v2 and a comment in the code says v2+.
>>>>> Glad I do not have to deal with this any more....
>>>>
>>>> Frans,
>>>>
>>>> That is exactly the issue that is so annoying.  The COPYING file usually
>>>> says the standard GPLv2, but if you go and read the license text in the
>>> code
>>>> that is where it says GPLv2 (or later) so GPLv2+.  This patch was
>>> modified
>>>> to go off the license in the code since that is more likely what the
>>>> developer actually intended and not an auto-generated file.
>>>>
>>>> Koen,
>>>>
>>>> What about GPLv3 licensed files with an exception?  Right now I have
>>> that as
>>>> GPLv3+exception.  Was there ever any discussion about how to handle
>>> these?
>>>> I am trying to indicate that it is not a standard GPLv3 license.
>>>
>>> Chase,
>>>
>>> Does it say what kind of exception it is? If it has a name, it's better to
>>> specify it. For libgcc/libstdc++ I ended up specifying "GPLv3 with GCC
>>> RLE",
>>> which stands for GCC Runtime Library Exception:
>>
>> Denys,
>>
>> The COPYING.EXCEPTION file has the title "AUTOCONF CONFIGURE SCRIPT 
>> EXCEPTION".  Would you like this changed to "GPLv3 with Autoconf CSE"?
> 
> Chase,
> 
> Either "GPLv3 with Autoconf CSE" or even "GPLv3 with Autoconf Configure 
> Script Exception"... I'm not sure CSE is as common as RLE - here's the 
> list of current GNU exceptions:

GCC and Autoconf both being GNU projects, their license is probably not
GPLv3, but GPLv3+ (with some exception), in the discussed notation. ;-)

Regards,
Andreas


