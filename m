Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PgK6w-0001nS-33
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 17:45:18 +0100
Received: (qmail 24764 invoked by uid 503); 21 Jan 2011 16:48:09 -0000
Received: from b9.ovh.net (HELO mail95.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 21 Jan 2011 16:48:09 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Jan 2011 18:44:37 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Jan 2011 18:44:36 +0200
Message-ID: <4D39B7F4.6050403@eukrea.com>
Date: Fri, 21 Jan 2011 17:44:36 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295598581-12927-1-git-send-email-raj.khem@gmail.com>	<4D394AC0.90300@eukrea.com>
	<AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
In-Reply-To: <AANLkTi=Jdmsr8sYYpOMTOqdpoi9iHiyFBcAAqnfoaMAN@mail.gmail.com>
X-Ovh-Tracer-Id: 13255219605255990601
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 3/3] busybox_1.18.2.bb: slugos needs a modified version of usb.sh script
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
X-List-Received-Date: Fri, 21 Jan 2011 16:45:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/01/2011 17:33, Khem Raj wrote:
> On Fri, Jan 21, 2011 at 12:58 AM, Eric Bénard<eric@eukrea.com>  wrote:
>> Hi Khem,
>>
>> On 21/01/2011 09:29, Khem Raj wrote:
>>>
>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>> ---
>>>   recipes/busybox/busybox-1.18.2/slugos/usb.sh |   33
>>> ++++++++++++++++++++++++++
>>
>> Can't it become the generic script ? What makes it slugos specific ? (I
>> didn't make a diff vs the other one so the question may be stupid ;-)
>>
>
> you should have diffed them. uevents are stored in different directory on slugos
>
you could also put this in the commit log to prevent this diff to discover 
what is the change :-)


Eric


