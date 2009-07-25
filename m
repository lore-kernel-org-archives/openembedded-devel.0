Received: from [209.85.219.207] (helo=mail-ew0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MUhkZ-00077Y-VK
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Jul 2009 15:57:24 +0200
Received: by ewy3 with SMTP id 3so1869070ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jul 2009 06:42:53 -0700 (PDT)
Received: by 10.210.88.7 with SMTP id l7mr2472619ebb.15.1248529373729;
	Sat, 25 Jul 2009 06:42:53 -0700 (PDT)
Received: from ?192.168.1.64? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 12sm9046784ewy.31.2009.07.25.06.42.51
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Jul 2009 06:42:53 -0700 (PDT)
Message-ID: <4A6B0BCD.9010108@xora.org.uk>
Date: Sat, 25 Jul 2009 14:42:37 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.22 (Windows/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0907250800110.9021@localhost>	<200907251452.41374.holger+oe@freyther.de>
	<alpine.LFD.2.00.0907250858080.9674@localhost>
In-Reply-To: <alpine.LFD.2.00.0907250858080.9674@localhost>
Subject: Re: getting bitbake-1.8.12 for the org.openembedded.dev branch?
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
X-List-Received-Date: Sat, 25 Jul 2009 13:57:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Robert P. J. Day wrote:
> On Sat, 25 Jul 2009, Holger Hans Peter Freyther wrote:
>
>   
>> On Saturday 25 July 2009 14:15:08 Robert P. J. Day wrote:
>>
>>     
>>>   would it not make more sense to have even the "dev" branch come
>>> with the required version of bitbake embedded in the checkout?
>>> or, failing that, just toss that incomplete bitbake directory
>>> entirely?
>>>       
>> If you look into this directory it will only contain *.pyc files and
>> I don't think it makes any sense to put bitbake into the
>> OpenEmbedded repository.
>>     
>
>   in a sense, i agree with that.  the problem is that the precedent
> has already been set by having bitbake in the stable/2009 branch and,
> based on the principle of least surprise, you shouldn't suddenly yank
> something out of a branch if developers are used to seeing it there.
>
>   
Your standing on your head. Bitbake wasnt yanked out of anything. It was 
added to the stable branch in good engineering fashion as thats the 
version stable/2009 will always build with. Development moves with 
bitbake so it makes no sense to put it in.

Graeme



