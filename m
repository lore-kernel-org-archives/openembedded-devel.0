Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OOuYo-00047W-Gc
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:29:53 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OOuUM-0002co-Sp from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 08:25:14 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 16 Jun 2010 08:25:14 -0700
Received: from [172.30.80.160] ([172.30.80.160]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Jun 2010 09:25:13 -0600
Message-ID: <4C18ECD5.9040108@mentor.com>
Date: Wed, 16 Jun 2010 08:25:09 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>	<1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>	<hva6if$vtv$1@dough.gmane.org>	<20100616150958.GC20969@excalibur.local>
	<hvapp0$9vs$1@dough.gmane.org>
In-Reply-To: <hvapp0$9vs$1@dough.gmane.org>
X-OriginalArrivalTime: 16 Jun 2010 15:25:13.0954 (UTC)
	FILETIME=[1DE5A420:01CB0D68]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 1/4] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Wed, 16 Jun 2010 15:29:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 16-06-10 17:09, Stefan Schmidt wrote:
>> Hello.
>>
>> On Wed, 2010-06-16 at 11:46, Koen Kooi wrote:
>>> On 15-06-10 20:15, Stefan Schmidt wrote:
>>>> From: Ken Gilmer <ken@buglabs.net>
>>>>
>>>>
>>>> Signed-off-by: Ken Gilmer <ken@buglabs.net>
>>>> Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
>>> Acked-by: Koen Kooi <koen@openembedded.org>
>> Just to make sure I understand the stable process correctly. As this patches
>> don't touch anything in the core system I'm fine apply them to stable myself
>> after fetching them with the ACK form patchwork, right?
> 
> Not quite, you need 2 acks from maintainers of the stable branch (which
> I think includes Marcin, Denys and me).
> But given the low impact of these patches and the general stagnation of
> stable/2009, I think it's safe to apply these.

My understanding was that it depends on the area.  I didn't ack the 
bug20 specific stuff since that's got a maintainer listed (or am I 
confusing bug boards?) who should ack them.

-- 
Tom Rini
Mentor Graphics Corporation


