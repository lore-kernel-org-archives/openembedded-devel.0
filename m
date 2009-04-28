Received: from [195.96.192.9] (helo=sirio.fastnet.it ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefano.regno@spesonline.com>) id 1LyosS-0007ie-5G
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 17:05:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id B340895AC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:34 +0200 (CEST)
Received: from sirio.fastnet.it ([127.0.0.1])
	by localhost (sirio [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 08951-01-10 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:34 +0200 (CEST)
Received: from sole.fastnet.it (sole.fastnet.it [195.96.192.1])
	by sirio.fastnet.it (FASTnet-NAP) with ESMTP id 9027E95AB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 7B8481A61E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:34 +0200 (CEST)
Received: from sole.fastnet.it ([127.0.0.1])
	by localhost (sole [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 18179-01-5 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:34 +0200 (CEST)
Received: from [192.168.1.215]
	(host141-216-static.91-82-b.business.telecomitalia.it
	[82.91.216.141])
	by sole.fastnet.it (FASTnet-NAP) with ESMTP id 9A1091A61DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 17:00:32 +0200 (CEST)
Message-ID: <49F71A12.5050302@spesonline.com>
Date: Tue, 28 Apr 2009 17:00:34 +0200
From: Stefano Regno <stefano.regno@spesonline.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49CEAF3E.2050805@gmx.net>	<5c5e5c350903300148j5c4ec665o176a4a1ed0f5b48d@mail.gmail.com>	<49D0A271.3010902@gmx.net>
	<1238436006.11483.5.camel@port4>	<49D1177F.6040200@gremlin.it><49D29D5E.8040901@gmx.net>
	<49D310B6.7090005@gremlin.it>
In-Reply-To: <49D310B6.7090005@gremlin.it>
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at fastnet.it
Subject: Re: OE presentations
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
X-List-Received-Date: Tue, 28 Apr 2009 15:05:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alessandro GARDICH wrote:
> Robert Schuster wrote:
>> Hi Alessandro,
>>
>> Alessandro GARDICH schrieb:
>>> Hi all
>>>
>>> this is a presentation I did about Linux Embedded and OpenEmbedded in
>>> Italian for Linux Day (in Italy) in 2007.
>>>
>>> http://www.gremlin.it/download/index.php?dir=&file=LinuxDay2007%20-%20GNU%20Linux%20Embedded.pdf 
>>>
>> This link provokes some anti-leech thingie ... disturbing .. :$
>>
>> Anyway. I don't understand itialian but your slides look like you argue
>> that an embedded system has certain system parameters like RAM, storage,
>> CPU speeds that are much lower to what you expect from a desktop
>> machine. While this may be true for some time you are always risking
>> that next years' technology catches up with your assumptions very 
>> quickly.
>>
>> Just think about the Sheeva CPU which supports clockspeed up to 1.2GHz,
>> or the OMAP4 which will comes with 2 CPU cores.
>>
>> A better way to argue is IMO the great integration an embedded system
>> provides. The chip that makes up the system often contains various
>> controllers for e.g. ethernet, wireless, sound, lcd, bluetooth, ...
>> Often there is also a graphics core and a DSP added.
>>
>> And while having all these shiny stuff in they consume a fraction of the
>> power a desktop CPU does.
>>
>> That is at least the way I would introduce people to the embedded 
>> world. :)
>>
>> Regards
>> Robert
>>
>>
>> Anyone have info about beagle? or how can find info detailed about it?

>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> Yes, but as i said, it's a presentation of 2007 ...
> and was an introduction to Embedded Linux and OE, for in high scool 
> students and fresh linux users.
> Moreover, most ARM processor was under 300MHz in 2007
>
>


-- 
Peace cannot be kept by force; it can only be achieved by understanding --Albert Einstein




