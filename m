Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PV0Yk-0003lA-6R
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 12:39:14 +0100
Received: (qmail 19618 invoked by uid 503); 21 Dec 2010 12:14:44 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 21 Dec 2010 12:14:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 21 Dec 2010 13:39:08 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 21 Dec 2010 13:39:04 +0200
Message-ID: <4D1091D6.8040705@eukrea.com>
Date: Tue, 21 Dec 2010 12:39:02 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291941859-29257-1-git-send-email-eric@eukrea.com>	<AANLkTinOcF=bKiZGZz1p4YZHSpW8Hy3LLumvG6VbqWg6@mail.gmail.com>	<4D08B2C8.5010508@opendreambox.org>	<AANLkTi=rzhtfxbfi8VS_R+W8uZV_qe=Ur1or861LJoPm@mail.gmail.com>	<4D09FC00.1010304@opendreambox.org>
	<20101216154641.GA22134@gmail.com>
In-Reply-To: <20101216154641.GA22134@gmail.com>
X-Ovh-Tracer-Id: 10509149731289935177
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: [PATCH] gcc: introduce version 4.5.2
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
X-List-Received-Date: Tue, 21 Dec 2010 11:39:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Khem, hi Andreas,

On 16/12/2010 16:46, Khem Raj wrote:
> On (16/12/10 12:46), Andreas Oberritter wrote:
>> In the (hopefully unlikely) event that a random svn version of linaro
>> gcc introduces a regression, say on the MIPS platform, who am I going to
>> report that to? Would I have to bisect all linaro patches manually?
>> Surely, the upstream developers wouldn't care about reports about
>> heavily patched gccs, and linaro developers wouldn't care about MIPS.
>>
> Quite a lot of OE users are right now using armv7 in some form so I think linaro
> patches are very helpful to them.

Linaro is having an interesting discussion on the linaro-toolchain list about 
this :
http://lists.linaro.org/pipermail/linaro-toolchain/2010-December/000650.html
http://lists.linaro.org/pipermail/linaro-toolchain/2010-December/000651.html

Eric


