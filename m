Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1JD0wC-00026B-6R
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2008 18:11:28 +0100
Received: from [212.60.202.194] (helo=[192.168.2.163])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JD1L8-0001Ig-L7; Thu, 10 Jan 2008 18:37:14 +0100
Message-ID: <478651B8.4010304@kernelconcepts.de>
Date: Thu, 10 Jan 2008 18:11:20 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <1824361960.20080106235611@gmail.com>
	<47825896.7030301@kernelconcepts.de>
	<1133928457.20080108163429@gmail.com>
	<1199810941.6053.50.camel@localhost.localdomain>
	<456018236.20080110111917@gmail.com>
	<4785F7D7.7030506@kernelconcepts.de>
	<4786102C.7040703@adtelecom.es>
	<47860F56.7050205@kernelconcepts.de>
	<6810017939.20080110185102@gmail.com>
In-Reply-To: <6810017939.20080110185102@gmail.com>
X-Enigmail-Version: 0.95.0
Cc: openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Smallscreen mod for GtkFileChooser
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
X-List-Received-Date: Thu, 10 Jan 2008 17:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Paul Sokolovsky schrieb:
>   And here where caveat comes - think about screen rotation. Think
> about changing resolutions. Think about these actions happening while
> dialog is on screen...

I would not say this - it would be a major improvement over the current -
completely static - spacing. Of course these situations can occur, but that's
not the average user faces every day. Proper handling of changing display
parameters is completely different and much more intrusive topic.


Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


