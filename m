Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Mq2be-0002pF-4z
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 12:28:25 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Mq2bb-0002Qs-SX
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Sep 2009 12:28:19 +0200
Message-ID: <4AB8A6A2.9070106@kernelconcepts.de>
Date: Tue, 22 Sep 2009 12:27:46 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1253563660.4551.12.camel@conroy-linux>
In-Reply-To: <1253563660.4551.12.camel@conroy-linux>
X-Enigmail-Version: 0.95.7
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Bitbake filterProviders does not respect sorted priorities
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
X-List-Received-Date: Tue, 22 Sep 2009 10:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Chris Conroy schrieb:
> Cross-posting to the OE list since I haven't heard anything from the
> bitbake list after posting this last week. The providers code ignores
> package priorities and as a result unexpected packages can get chosen
> when using overlays with different priority settings.

I agree... would be good to see this fixed.

Anyone from the bitbake developers who can comment on the patch? It looks quite
trivial :-)

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


