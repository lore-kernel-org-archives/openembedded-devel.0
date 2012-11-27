Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1TdFeJ-00053z-5x
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 08:32:07 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Tue, 27 Nov 2012
	08:17:53 +0100
X-TM-IMSS-Message-ID: <29b73f9500227aac@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 29b73f9500227aac ;
	Tue, 27 Nov 2012 08:17:57 +0100
Message-ID: <50B46921.5050602@nedap.com>
Date: Tue, 27 Nov 2012 08:17:53 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50AF6C63.6080208@nedap.com>
	<20121123143224.GB31470@mi.fu-berlin.de>	<50B333B6.8020901@nedap.com>
	<20121126224236.GA24526@mi.fu-berlin.de>
In-Reply-To: <20121126224236.GA24526@mi.fu-berlin.de>
Subject: Re: openjdk-7-vm-jamvm
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
X-List-Received-Date: Tue, 27 Nov 2012 07:32:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/26/2012 11:42 PM, Henning Heinold wrote:
> On Mon, Nov 26, 2012 at 10:17:42AM +0100, Jaap de Jong wrote:
>> On 11/23/2012 03:32 PM, Henning Heinold wrote:
>>> On Fri, Nov 23, 2012 at 01:30:27PM +0100, Jaap de Jong wrote:
>>>> Hi,
>>>> how can I build openjdk-7-vm-jamvm?
>>>> If I bitbake openjdk-7 it is not added, while openjdk-7-vm-zero is added.
>>>> I'm building for arm.
>>>> Thanks!
>>>> Jaap
>>> Add it to your image.
>>>
>> bitbake openjdk-7-vm-jamvm fails:
>>
>> ERROR: Nothing PROVIDES 'openjdk-7-vm-jamvm'
>>
>> And so fails adding it to my images as well...
>>
>> |  * opkg_install_cmd: Cannot install package openjdk-7-vm-jamvm.
>>
>> Jaap
> Hi Jaap,
>
> I found two problems for building openjdk-7 with additional vms.
> They are now fixed in master.
>
> Bye Henning
That's great news!
Many thanks!
Jaap



