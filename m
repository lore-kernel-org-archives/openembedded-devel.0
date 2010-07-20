Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1ObMBE-0000mw-7P
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 01:24:58 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1ObMB3-0001JP-7S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 16:24:45 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 20 Jul 2010 16:24:44 -0700
Received: from [172.30.80.25] ([172.30.80.25]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 20 Jul 2010 17:24:43 -0600
Message-ID: <4C463035.7010100@mentor.com>
Date: Tue, 20 Jul 2010 16:24:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100709204055.GA12163@excalibur.local>	<20100720070108.GE1512@excalibur.local>	<i23lkm$ftn$1@dough.gmane.org>	<20100720084026.GI1512@excalibur.local>	<i24kf7$3d3$1@dough.gmane.org>	<20100720173425.GL1512@excalibur.local>	<i24qm2$qc6$1@dough.gmane.org>	<4C45F5FF.3010106@mentor.com>	<i252l1$npj$1@dough.gmane.org>
	<4C462C32.40202@mentor.com>
In-Reply-To: <4C462C32.40202@mentor.com>
X-OriginalArrivalTime: 20 Jul 2010 23:24:43.0887 (UTC)
	FILETIME=[BC2887F0:01CB2862]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 23:24:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 20-07-10 21:16, Tom Rini wrote:
>>> Koen Kooi wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> On 20-07-10 19:34, Stefan Schmidt wrote:
>>>>> Hello.
>>>>>
>>>>> On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
>>>>>> On 20-07-10 10:40, Stefan Schmidt wrote:
>>>>>>> So your suggestion is to wait until all three are done?
>>>>>> 'Wait' is maybe the wrong word. I would try to do a call to arms 
>>>>>> to get
>>>>>> more people interested into getting this done.
>>>>> Wasn't there a list produced with all recipes that used legacy
>>>>> staging? I swear
>>>>> I have seen something like this but I can't find it in my recent 
>>>>> builds.
>>>> In your TMPDIR:
>>>>
>>>> koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq |
>>>> wc -l
>>>> 53
>>>>
>>>> It includes beasts like perl and python.
>>> perl yes, python no.  Overall point, yes.
>>>
>>
>> Mine lists:
>>
>> /OE/org.openembedded.dev/recipes/perl/perl_5.8.8.bb
>> /OE/org.openembedded.dev/recipes/python/python_2.6.4.bb
>>
>> And that's from a rebuild from scratch last week.
> 
> Going off list... 
> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=a753e680011a9843e0cd0ee928fd508667445d00 
> and I just did a -c clean and rebuild.

Welp, I fail today.  Sorry all.

-- 
Tom Rini
Mentor Graphics Corporation


