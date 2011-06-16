Received: from 12.98.mail-out.ovh.net ([178.32.114.28]
	helo=98.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QX7ed-0008Hy-TS
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 10:10:20 +0200
Received: from mail26.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 98.mail-out.ovh.net (Postfix) with SMTP id B5E8B4B6004
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2011 09:59:45 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Jun 2011 09:59:52 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Jun 2011 09:59:51 +0200
Message-ID: <4DF9B7F6.60408@eukrea.com>
Date: Thu, 16 Jun 2011 09:59:50 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
	<201106160954.59066.schnitzeltony@gmx.de>
In-Reply-To: <201106160954.59066.schnitzeltony@gmx.de>
X-Ovh-Tracer-Id: 13256064028684234057
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -150
Subject: Re: [PATCH v2 0/2] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Thu, 16 Jun 2011 08:10:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andreas,

On 16/06/2011 09:54, Andreas Mueller wrote:
> On Monday, June 06, 2011 11:25:43 PM Andreas Mueller wrote:
>> Changes to V1:
>>
>> * changed commit messages
>> * split patch
>>
>> Andreas Mueller (2):
>>    mx28 SOC: set correct addresses for u-boot
>>    mx28evk: set valid console
>>
>>   conf/machine/include/imx28.inc |    4 ++--
>>   conf/machine/mx28evk.conf      |    2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)
> Can somebody please take care for these harmless 3 lines?
>
done
Thanks,

Eric


