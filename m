Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PHjGG-0002WE-Vk
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 21:33:18 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PHjFF-0004gH-CF from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 12:32:13 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 14 Nov 2010 12:32:13 -0800
Received: from [172.30.80.225] ([172.30.80.225]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 14 Nov 2010 13:32:12 -0700
Message-ID: <4CE04749.8070003@mentor.com>
Date: Sun, 14 Nov 2010 13:32:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin8E_sSKJcCW7_gtx85_Uo6SvwHFTdiUA8XZ2tv@mail.gmail.com>	<AANLkTinuoktvgvT9V7OX1=FkMfeAgztmDaOCFMdH5x7d@mail.gmail.com>	<4CE02C8A.2040002@mentor.com>
	<AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
In-Reply-To: <AANLkTinh8PHmpMrPBQUUb26MAQmWzU==vKzSY9Y_StTx@mail.gmail.com>
X-OriginalArrivalTime: 14 Nov 2010 20:32:12.0219 (UTC)
	FILETIME=[046A18B0:01CB843B]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-11-12
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
X-List-Received-Date: Sun, 14 Nov 2010 20:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2010 12:23 PM, Yury Bushmelev wrote:
> 2010/11/14 Tom Rini<tom_rini@mentor.com>:
>> On 11/14/2010 11:11 AM, Frans Meulenbroeks wrote:
>>>
>>> 2010/11/12 Cliff Brake<cliff.brake@gmail.com>:
>>>>
>>>> testing-next is ready for clean builds.  Not many builds succeeded
>>>> last week--I suspect people have been busy:
>>>
>>> Actually my builds also succeeded (apart from the neek one which seem
>>> to require some more love). The autobuilder did it's job quite nicely,
>>> but I was just not around to verify the results and update the page.
>>> The neek requires at least the os2 patch.
>>>
>>> Testing 2010-11-12 gives the same results. updated the testing page.
>>
>> After my first week of doing some testing branch test builds I was thinking,
>> would some form of either automated result submitting or form-based result
>> submitting be a good idea?  We could try and use a google doc spreadsheet /
>> form, for example.  Thoughts?
>
> I'll prefer to use our oestats-server to auto-publish builds data.
> Oestats have complete information about builds.

So some form of linkage between the two?  Or is there already an easy 
way to see what builds on the tinderbox view have been done this way 
that I don't see (also just started poking that stuff).  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


