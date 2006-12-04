Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lpotter@trolltech.com>) id 1GrIh5-0003R4-99
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 19:37:35 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP
	id BA2CF6000A; Mon,  4 Dec 2006 19:36:46 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP
	id 485C860035; Mon,  4 Dec 2006 19:36:46 +0100 (CET)
Received: from [172.18.1.6] (unknown [172.18.1.6])
	by mail.trolltech.com.au (Postfix) with ESMTP id 00673296963;
	Tue,  5 Dec 2006 04:36:43 +1000 (EST)
Message-ID: <45746ACC.7050001@trolltech.com>
Date: Tue, 05 Dec 2006 04:37:00 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1) Gecko/20061101 SeaMonkey/1.1b
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>	<20061202202256.GI25780@hovland.org>
	<op.tjx8spx2dbah4f@home888>
In-Reply-To: <op.tjx8spx2dbah4f@home888>
Subject: Re: New palm environment
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Dec 2006 18:37:35 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit



Vovan wrote:
> On Sat, 02 Dec 2006 23:22:56 +0300, Erik Hovland <erik@hovland.org> wrote:
> 
>> Scratch your itch. There is enough room in the community for another
>> environment. But please consider why GPE or Opie can't do what you need
>> before taking on what could be a huge task.
>>
> 
> My main problem is perfomance. For example:in Symbian "addressbook"  
> application
> starts in less than a second; in Qtopia it starts something about 2..3  
> seconds!

Actually, if you use the 'fast load' option, which loads certain apps at 
startup, you will get a faster startup speed, which is the same way 
symbian loads apps, and gives you the perception that it is faster. You 
can also configure apps to be quicklaunched. For best results, configure 
Qtopia as 'singleexec' which gives the best performance memory size and 
startup speed.


> That is not acceptible for me :) I dont have 400 mhz CPU in SX1, I only  
> have 120mhz
> so it is a problem...
> 
> 


