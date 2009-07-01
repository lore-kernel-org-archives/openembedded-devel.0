Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MM0B8-0007Mo-UI
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 15:48:53 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MLzz7-00068W-GQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 15:36:25 +0200
Message-ID: <4A4B6679.4010107@kernelconcepts.de>
Date: Wed, 01 Jul 2009 15:36:57 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090701115959.GA10962@pcimg12.dei.unipd.it>
In-Reply-To: <20090701115959.GA10962@pcimg12.dei.unipd.it>
X-Enigmail-Version: 0.95.7
Subject: Re: looking for an arm-based board
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
X-List-Received-Date: Wed, 01 Jul 2009 13:49:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Ottavio Campana schrieb:
> Since I don't know all the supported machines, can you suggest me a cost
> effective ARM7 or ARM9 board that works well with OE stable/2009?

the FriendlyARM stuff (http://www.friendlyarm.net) is quite cheap (using a
Samsung ARM9). Its supported out of the box in .dev and adding the necessary
files to stable should be trivial. There is a forked OE stable repository that
can be used as well.

If it turns out that you need more CPU power you can always use a BeagleBoard
and add an USB Ethernet adapter.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


