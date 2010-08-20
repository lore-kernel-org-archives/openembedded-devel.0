Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1OmOSc-0001u0-Np
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 12:04:43 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 20 Aug 2010 12:04:08 +0200
X-TM-IMSS-Message-ID: <0f084ede000052cf@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0f084ede000052cf for
	<jaap.dejong@nedap.com>; Fri, 20 Aug 2010 12:04:12 +0100
Message-ID: <4C6E5317.2040104@nedap.com>
Date: Fri, 20 Aug 2010 12:04:07 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.11) Gecko/20100713 Lightning/1.0b1 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C624772.8000607@nedap.com>	<20100811072548.GB7282@mi.fu-berlin.de>	<20100819105518.GL11569@jama>	<20100819121301.GA21426@mi.fu-berlin.de>	<20100819122903.GM11569@jama>
	<4C6E29B3.8050801@nedap.com>	<20100820074410.GO11569@jama>
	<4C6E354A.9040906@nedap.com> <20100820080759.GP11569@jama>
In-Reply-To: <20100820080759.GP11569@jama>
X-OriginalArrivalTime: 20 Aug 2010 10:04:08.0413 (UTC)
	FILETIME=[079720D0:01CB404F]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problem building openjdk-6
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
X-List-Received-Date: Fri, 20 Aug 2010 10:04:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Martin,
the translation (unstable) is successful!
Many thanks!
Jaap

On 08/20/2010 10:07 AM, Martin Jansa wrote:
> On Fri, Aug 20, 2010 at 09:56:58AM +0200, Jaap de Jong wrote:
>    
>> Thanks Martin,
>>
>> it is translating right now...
>> do_configure for openjdk-6-jre-6b18-1.8-r10.6 passed, so this problem is
>> solved!
>>
>> The same (minor changes) applies to the stable/2009 branch?
>>      
> You're welcome!
>
> I'm not using/watching stable/2009 branch at all, so no idea, but
> openjdk built fine about month ago.
>
> check if this patch and other java related changes are already in stable/2009
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=fb352eddb0c1356a03cb304ae40d3d67077de521
>
> Or wait for OE java gurus to test/fix it.
>
> Regards,
>    


