Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Gr0ma-0001gP-GM
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 00:30:04 +0100
Received: from [84.245.184.204] (helo=[192.168.7.190])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gr1LN-0006aD-Vk
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Dec 2006 01:06:02 +0100
Message-ID: <45735DC9.1030201@kernelconcepts.de>
Date: Mon, 04 Dec 2006 00:29:13 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.8 (X11/20061115)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <37367b3a0612021013p700b017bmdaa382eb76527c8e@mail.gmail.com>	<20061202202256.GI25780@hovland.org>
	<op.tjx8spx2dbah4f@home888>
In-Reply-To: <op.tjx8spx2dbah4f@home888>
X-Enigmail-Version: 0.94.0.0
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
X-List-Received-Date: Sun, 03 Dec 2006 23:30:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

basically Michael and Erik mentioned the most important things before - i guess
the major problems will be caused by increasing requirements for this kind of
software stacks.

Vovan wrote:
> On Sat, 02 Dec 2006 23:22:56 +0300, Erik Hovland <erik@hovland.org> wrote:
> 
> My main problem is perfomance. For example:in Symbian "addressbook"  
> application
> starts in less than a second; in Qtopia it starts something about 2..3  
> seconds!
> That is not acceptible for me :) I dont have 400 mhz CPU in SX1, I only  
> have 120mhz
> so it is a problem...

I must admit that a good adaption of one of the existing UI environments to the
SX1 is not really easy but creating and maintaining a new one is not easier.
Imagine what you could achieve investing the time you had to spend in a new UI
environment project in one of the existing ones and optimizing it for less
powerful devices. There is really much room for improvements - large parts of
the software is written for more powerful devices and sometimes without mobile
devices in mind at all. But the main reason to prefer improvements over a new
project is the fact that more people would have benefits from improvements than
from a new project.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


