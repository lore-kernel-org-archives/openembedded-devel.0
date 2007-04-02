Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HYKeB-0006Pa-Ag
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 13:24:27 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HYKvu-0000ok-0y
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Apr 2007 13:42:46 +0200
Message-ID: <4610E7D7.8060005@kernelconcepts.de>
Date: Mon, 02 Apr 2007 13:24:07 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4610C901.2010306@openhardware.net>
	<D5F22F8D-AEDD-40E9-9F15-4BFA190D19BB@selfish.org>
In-Reply-To: <D5F22F8D-AEDD-40E9-9F15-4BFA190D19BB@selfish.org>
X-Enigmail-Version: 0.94.0.0
Subject: Re: patch: shasum vs. sha256sum
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
X-List-Received-Date: Mon, 02 Apr 2007 11:24:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Holger Freyther schrieb:

> Philipp changed this line from shasum to sha256sum as he/we thought  
> sha256sum is more commonly available. If that is not the case I would  
> propose to disapprove the change as it is more easy to get the  
> required binary from cpan than to recompile coreutils-native.
> As a last resort we could add sha256sum code to base.bbclass...

sounds like a good idea, I just ran into the same problem with Ubuntu.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


