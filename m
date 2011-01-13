Received: from 31.mail-out.ovh.net ([213.186.62.10])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdP7k-0005vg-FW
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 16:30:04 +0100
Received: (qmail 5940 invoked by uid 503); 13 Jan 2011 16:04:07 -0000
Received: from b9.ovh.net (HELO mail173.ha.ovh.net) (213.186.33.59)
	by 31.mail-out.ovh.net with SMTP; 13 Jan 2011 16:04:07 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 17:29:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 17:29:31 +0200
Message-ID: <4D2F1A5A.6000003@eukrea.com>
Date: Thu, 13 Jan 2011 16:29:30 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D2E9269.2020409@gmail.com>	<1294926304-22239-1-git-send-email-eric@eukrea.com>
	<4D2F1728.3050308@mentor.com>
In-Reply-To: <4D2F1728.3050308@mentor.com>
X-Ovh-Tracer-Id: 1899111668599991625
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH v2] strace: add patch allowing compilation with kernel headers >= 2.6.32
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
X-List-Received-Date: Thu, 13 Jan 2011 15:30:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/01/2011 16:15, Tom Rini wrote:
> On 01/13/2011 06:45 AM, Eric Bénard wrote:
>> tested with kernel headers 2.6.31& 2.6.37 : both compile fine.
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>
> I still say (and on top of my last, just sent email) that we basically only
> need strace 4.5.14 for avr32 and everyone else should be fine with 4.5.20.
>
this patch was sent before reading your email :-)

Eric


