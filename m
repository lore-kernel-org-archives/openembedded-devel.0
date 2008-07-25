Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KMPoK-0007N3-BU
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 18:06:28 +0200
Received: (qmail invoked by alias); 25 Jul 2008 16:05:06 -0000
Received: from BAA23da.baa.pppool.de (EHLO [192.168.178.36]) [77.128.35.218]
	by mail.gmx.net (mp061) with SMTP; 25 Jul 2008 18:05:06 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/aM/1nuWraL/uwb0xHAPf/S5386ufHoC+SxKYady
	2Q5Em7tshkVNe9
Message-ID: <4889F9B0.5010103@gmx.de>
Date: Fri, 25 Jul 2008 18:05:04 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4889169C.7040108@gmx.de>
	<20080725030222.GC4715@smtp.west.cox.net>	<d1b08f940807250044k51c6b1f8h9d5f976d83069a54@mail.gmail.com>	<200807250956.39492.openembedded@haerwu.biz>	<d1b08f940807250109g5f2a4dfeqf2e89fdd551fd8b8@mail.gmail.com>
	<20080725155551.GG4715@smtp.west.cox.net>
In-Reply-To: <20080725155551.GG4715@smtp.west.cox.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.65
Subject: Re: RFC: kernel.bbclass and collie changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 16:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Fri, Jul 25, 2008 at 10:09:04AM +0200, Andrea Adami wrote:
>   
>>>> while you're there please weak-assign too:
>>>>
>>>> KERNEL_IMAGETYPE ?= "zImage"
>>>>         
>>> Thats default set by kernel.bbclass
>>>       
>> I meant in zaurus-2.6.inc
>>     
>
> Er, isn't that at the level where you know what the board needs and do
> want to enforce build choices?
>   
In theory yes. But if you replaced sharp bootloader with u-boot then you
need to change it.
But these changes can be done after the RFCed stuff is in.



