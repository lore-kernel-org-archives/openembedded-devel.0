Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JLx9w-0007pa-TT
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 09:58:37 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JLxbr-0005aO-FH
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2008 10:27:27 +0100
Message-ID: <47A6D3C2.10304@kernelconcepts.de>
Date: Mon, 04 Feb 2008 09:58:42 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1201823499.20311.26.camel@localhost.localdomain>
	<20080203210353.438dffaf@cimmeria>
In-Reply-To: <20080203210353.438dffaf@cimmeria>
X-Enigmail-Version: 0.95.0
Subject: Re: Monotone issues
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
X-List-Received-Date: Mon, 04 Feb 2008 08:58:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Graeme Gregory schrieb:
> Sounds like it is time for our regular re-assessment of the use
> of monotone. Maybe we should start another round of testing other
> SCM systems again. I know your not the only person seeing mtn start
> to creak.

I agree... I have never been a friend of monotone but got used to it. But it
reminds you that it is still not ready for complex projects. Just to mention the
pain that updates are not atomic operations and problems during an update end up
in the pain of a broken repository.
Another major problem is that a monotone update sometimes causes a very time
consuming database update. Waiting half a day on a really fast machine for the
database to become usable again is a real showstopper.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


