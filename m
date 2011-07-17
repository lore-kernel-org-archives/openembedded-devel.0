Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QiaLQ-0000CR-B1
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 01:01:53 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QiaHV-0005JL-Hl from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jul 2011 15:57:49 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Sun, 17 Jul 2011 15:55:49 -0700
Received: from [172.30.80.54] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Sun, 17 Jul 2011 15:57:48 -0700
Message-ID: <4E2368E7.2050500@mentor.com>
Date: Sun, 17 Jul 2011 15:57:43 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <09D9BE2AC4AA764DABAA8C91E48D819E0157569594@DEMCHP99E35MSX.ww902.siemens.net>	<1310930168.4288.47.camel@mattotaupa>	<09D9BE2AC4AA764DABAA8C91E48D819E0157569595@DEMCHP99E35MSX.ww902.siemens.net>
	<1310934411.4288.98.camel@mattotaupa>
In-Reply-To: <1310934411.4288.98.camel@mattotaupa>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 Jul 2011 22:55:49.0780 (UTC)
	FILETIME=[AC164D40:01CC44D4]
Subject: Re: [PATCH v2] packaged-staging: fixed fetching from PSTAGE_MIRROR with file:// uri
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
X-List-Received-Date: Sun, 17 Jul 2011 23:01:53 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 07/17/2011 01:26 PM, Paul Menzel wrote:
> Am Sonntag, den 17.07.2011, 21:42 +0200 schrieb Aeschbacher, Fabrice:
>> From: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
>>
>> Packaged-staging:
>>  
>>  * This patch fixes fetching pre-built staging packages from PSTAGE_MIRROR having file:// uri
>>    see: http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/033938.html
>>    (thanks to Tom Rini for helping me fixing this)
>>
>> Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
> 
> […]
> 
> Acked-by: Paul Menzel <paulepanter@users.sourceforge.net>
> 
> I would still waiting for Tom’s Acked-by or Signed-off-by line.

Acked-by: Tom Rini <tom_rini@mentor.com>

And for the records, I forget if we found that in poky at the time, I
came up with it or Chris Larson did.   But it's kosher any which way :)

-- 
Tom Rini
Mentor Graphics Corporation


