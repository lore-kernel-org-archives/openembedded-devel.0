Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcjOW-00056x-NS
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 19:56:36 +0100
Received: (qmail 19313 invoked by uid 503); 11 Jan 2011 18:59:48 -0000
Received: from b9.ovh.net (HELO mail95.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 11 Jan 2011 18:59:47 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 11 Jan 2011 20:56:07 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 11 Jan 2011 20:56:06 +0200
Message-ID: <4D2CA7C5.9060307@eukrea.com>
Date: Tue, 11 Jan 2011 19:56:05 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>	<4D2C22A3.3030602@xora.org.uk>
	<4D2C2456.9050000@eukrea.com>
	<201101111251.15050.marcin@juszkiewicz.com.pl>
In-Reply-To: <201101111251.15050.marcin@juszkiewicz.com.pl>
X-Ovh-Tracer-Id: 12089350250605096265
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Tue, 11 Jan 2011 18:56:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/01/2011 19:51, Marcin Juszkiewicz wrote:
> Dnia wtorek, 11 stycznia 2011 o 03:35:18 Eric Bénard napisał(a):
>> On 11/01/2011 10:28, Graeme Gregory wrote:
>>> If some distro does not have the sources in its fetchable list can
>>> the source archive not be copied to a more general source mirror?
>>
>> more globally, shouldn't OE provide a source mirror for everything
>> which can  be fetched by the project. This would avoid problems like
>> handhelds.org's vanishing.
>
> OpenEmbedded project provided metadata. It is distributions which should
> provide sources. They select which SRCREVs are used...

I was thinking of thttp://sources.openembedded.org/ which doesn't seems to be 
linked to any distro and already mirrors some sources archives.

Eric


