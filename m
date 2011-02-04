Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PlONH-0001VT-Kz
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 17:19:07 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PlOML-0003tY-29 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 08:18:09 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 4 Feb 2011 08:18:08 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 4 Feb 2011 09:18:07 -0700
Message-ID: <4D4C26BA.7090106@mentor.com>
Date: Fri, 04 Feb 2011 09:18:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PlNJv-0005sP-PU@melo.openembedded.org>	<4D4C1B8C.9080709@mentor.com>
	<AANLkTim=14HWLtuNDr5vqZSbt=o=MzF5QqVYGUOb_sKy@mail.gmail.com>
In-Reply-To: <AANLkTim=14HWLtuNDr5vqZSbt=o=MzF5QqVYGUOb_sKy@mail.gmail.com>
X-OriginalArrivalTime: 04 Feb 2011 16:18:08.0010 (UTC)
	FILETIME=[1C07E6A0:01CBC487]
Subject: Re: [oe-commits] Martin Jansa : gnu-config: update also bindir change to replace /usr/bin/ env instead of /usr/bin/perl
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
X-List-Received-Date: Fri, 04 Feb 2011 16:19:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2011 08:57 AM, Otavio Salvador wrote:
> On Fri, Feb 4, 2011 at 15:30, Tom Rini<tom_rini@mentor.com>  wrote:
>> On 02/04/2011 08:11 AM, git version control wrote:
> ...
>>> gnu-config: update also bindir change to replace /usr/bin/env instead of
>>> /usr/bin/perl
> ...
>> This is wrong.  /usr/bin/env is one of those mandated things everyone has.
>>   And ${bindir} can be too long :)  Based on the previous commit, this
>> test/regex should be able to go away.
>
> This is right since micro can build without /usr et all.

OK, you're right.  But that comment is unclear :)

-- 
Tom Rini
Mentor Graphics Corporation


