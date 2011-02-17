Received: from 29.mail-out.ovh.net ([87.98.216.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pq41g-0000AT-Ny
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 14:36:09 +0100
Received: (qmail 1946 invoked by uid 503); 17 Feb 2011 13:34:02 -0000
Received: from b9.ovh.net (HELO mail644.ha.ovh.net) (213.186.33.59)
	by 29.mail-out.ovh.net with SMTP; 17 Feb 2011 13:34:02 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Feb 2011 15:34:57 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Feb 2011 15:34:56 +0200
Message-ID: <4D5D2400.4060202@eukrea.com>
Date: Thu, 17 Feb 2011 14:34:56 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>	<1297852433-31160-3-git-send-email-eric@eukrea.com>
	<20110216225543.GI14525@sakrah.homelinux.org>
In-Reply-To: <20110216225543.GI14525@sakrah.homelinux.org>
X-Ovh-Tracer-Id: 2594073385628839241
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH 03/10] gnokii: add latest version
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
X-List-Received-Date: Thu, 17 Feb 2011 13:36:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/02/2011 23:55, Khem Raj wrote:
> On (16/02/11 11:33), Eric Bénard wrote:
>> - build tested for armv5 with PARALLEL_MAKE="-j8" so I removed
>> PARALLEL_MAKE = "" which was set in previous recipes.
>>
>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>> ---
>>   recipes/gnokii/gnokii_0.6.30.bb |   28 ++++++++++++++++++++++++++++
>>   1 files changed, 28 insertions(+), 0 deletions(-)
>>   create mode 100644 recipes/gnokii/gnokii_0.6.30.bb
>>
>> diff --git a/recipes/gnokii/gnokii_0.6.30.bb b/recipes/gnokii/gnokii_0.6.30.bb
>> new file mode 100644
>> index 0000000..0f82c5d
>> --- /dev/null
>> +++ b/recipes/gnokii/gnokii_0.6.30.bb
>> @@ -0,0 +1,28 @@
>> +LICENSE = "GPL"
>
> which version of GPL ?
>
GPLv2, fixed int he version I'm going to push.

Eric


