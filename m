Received: from jak.nl ([65.204.18.188]) by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <arjan@jak.nl>) id 1OUFTh-0005dL-My
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 10:50:40 +0200
Received: (qmail 45247 invoked by uid 89); 1 Jul 2010 08:45:52 -0000
Received: from jak.nl (HELO ?128.63.129.1?) (65.204.18.188)
	by jak.nl with SMTP; 1 Jul 2010 08:45:52 -0000
Message-ID: <4C2C55B4.2080601@jak.nl>
Date: Thu, 01 Jul 2010 10:45:40 +0200
From: Arjan <arjan@jak.nl>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C289700.1000409@jak.nl> <4C289A86.5010508@freyther.de>
	<AANLkTinkr9YuMo0z6wxJuIPfcPLzJ6TPYuzPWsInAA8N@mail.gmail.com>
In-Reply-To: <AANLkTinkr9YuMo0z6wxJuIPfcPLzJ6TPYuzPWsInAA8N@mail.gmail.com>
X-SA-Exim-Connect-IP: 65.204.18.188
X-SA-Exim-Mail-From: arjan@jak.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FeeBSD as OE build host
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
X-List-Received-Date: Thu, 01 Jul 2010 08:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 28-6-2010 19:24, Khem Raj wrote:
> On Mon, Jun 28, 2010 at 5:50 AM, Holger Freyther<holger+oe@freyther.de>  wrote:
>    
>> On 06/28/2010 08:35 PM, Arjan wrote:
>>      
>>> Hello,
>>>
>>> I read here
>>> [http://wiki.openembedded.net/index.php/OEandYourDistro#FreeBSD] FreeBSD
>>> was/is supported as build host. Is this still true?
>>> Are there pitfalls or other prerequisites beside the ones mentioned?
>>>        
>> I haven't tried for quite a while so there might be some more issues
>> again.... The most common thing is replacing cp -a with cp -pFR (IIRC).
>>
>>      
> there is a branch koen/darwin-host-fixes which should also have some fixes
> that could help you. I have not tried mac osx or freebsd build in long time.
>
>    

OK thanks for the hints. I will give it a try.


