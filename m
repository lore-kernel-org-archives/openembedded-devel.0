Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OiUVj-0007js-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 17:43:35 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id CBDA543F048D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Aug 2010 18:43:23 +0300 (EEST)
Message-ID: <4C602232.8030806@dcombus.com>
Date: Mon, 09 Aug 2010 18:43:46 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikjR5wxTzno2fJwtnDwVzDrQaMTVU=SiEbxHbCp@mail.gmail.com>	<1281353772-30862-1-git-send-email-henri.bragge@dcombus.com>	<1281354725.3767.25.camel@mattotaupa>
	<4C5FEF0B.2070600@dcombus.com>
	<1281357382.3767.28.camel@mattotaupa>
In-Reply-To: <1281357382.3767.28.camel@mattotaupa>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] gsnmp-0.3.0: fix quoting in autoconf macros
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
X-List-Received-Date: Mon, 09 Aug 2010 15:43:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Paul Menzel wrote:
> Am Montag, den 09.08.2010, 15:05 +0300 schrieb Henri Bragge:
>   
>> Paul Menzel wrote:
>>     
>>> Is there an upstream bug for this? If not, it would be great if you
>>> could sent it upstream.
>>>       
>> The bug is still present in upstream too, but I will send this patch to 
>> the gsnmp maintainer if it does the trick (or should it be the other way 
>> around?).
>>     
>
> I have no idea [1]. But I guess it would not hurt if you send it
> upstream anyway.
>
> [1] http://wiki.openembedded.net/index.php/Push_patches_upstream
>   

Got it accepted, included some upstream info in the patch (see v3).

- Henri


