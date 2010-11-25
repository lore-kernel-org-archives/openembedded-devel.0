Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLXAT-00039W-CN
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 09:27:01 +0100
Received: (qmail 4146 invoked by uid 503); 25 Nov 2010 08:30:11 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 08:30:11 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 10:25:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 10:25:47 +0200
Message-ID: <4CEE1D8A.10404@eukrea.com>
Date: Thu, 25 Nov 2010 09:25:46 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>	<1290620636-21238-2-git-send-email-eric@eukrea.com>	<AANLkTi=vHic9JYNfFH0-giLnB0x929Czhj3C_BriAN9L@mail.gmail.com>	<4CED64C8.7060909@eukrea.com>
	<icl56t$5k0$1@dough.gmane.org>
In-Reply-To: <icl56t$5k0$1@dough.gmane.org>
X-Ovh-Tracer-Id: 2128795249328958793
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] busybox: add 1.17.4 (latest stable version)
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
X-List-Received-Date: Thu, 25 Nov 2010 08:27:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/11/2010 09:02, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-11-10 20:17, Eric Bénard wrote:
>> On 24/11/2010 19:44, Khem Raj wrote:
>>> On Wed, Nov 24, 2010 at 9:43 AM, Eric Bénard<eric@eukrea.com>   wrote:
>>>> this is the latest stable version (1.17.3 + its fixes).
>>>>
>>>> Signed-off-by: Eric Bénard<eric@eukrea.com>
>>>
>>> Please install it on release branch as well. Do we still need 1.17.3 ?
>>>
>> if SHR switch to 1.17.4 we shouldn't need it anymore.
>> (and if Ångström 2010 also switch to 1.17.4 we won't need 1.17.1).
>>
>> Martin, Koen, are you ok with the patch below ?
>
> Yes, you can move angstrom 2010 to 1.18.x as well if you wish
>
OK, for the moment I switch to 1.17.4 and will wait 1.18.1 which should be the 
next stable version as 1.18.0 is currently considered as unstable.

Eric


