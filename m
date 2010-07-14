Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OZ6sV-0002Wz-8C
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 20:40:19 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OZ6sQ-0004rE-If from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 11:40:14 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 14 Jul 2010 11:40:14 -0700
Received: from [172.30.80.37] ([172.30.80.37]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 14 Jul 2010 12:40:13 -0600
Message-ID: <4C3E0486.2040605@mentor.com>
Date: Wed, 14 Jul 2010 11:40:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279130162-5731-1-git-send-email-raj.khem@gmail.com>
	<201007142231.43112.roman@khimov.ru>
In-Reply-To: <201007142231.43112.roman@khimov.ru>
X-OriginalArrivalTime: 14 Jul 2010 18:40:13.0428 (UTC)
	FILETIME=[FEE4B340:01CB2383]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gcc-configure-common.inc: Disable multilib	generation.
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
X-List-Received-Date: Wed, 14 Jul 2010 18:40:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Roman I Khimov wrote:
> В сообщении от Среда 14 июля 2010 21:56:02 автор Khem Raj написал:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes/gcc/gcc-4.5.inc              |    3 +++
>>  recipes/gcc/gcc-configure-common.inc |    2 +-
>>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> Acked-by: Roman I Khimov <khimov@altell.ru>

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


