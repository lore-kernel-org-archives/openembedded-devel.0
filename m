Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HYiek-00071O-JO
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 15:02:39 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HYiwd-00034m-E7
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Apr 2007 15:21:07 +0200
Message-ID: <46125058.3030302@kernelconcepts.de>
Date: Tue, 03 Apr 2007 15:02:16 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>	<460F5F87.3060403@dominion.kabel.utwente.nl>	<4610C6E6.30102@kernelconcepts.de>	<583221585.20070403130033@gmail.com>
	<46122905.2010703@dominion.kabel.utwente.nl>
In-Reply-To: <46122905.2010703@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Subject: Re: [oe-commits] org.oe.dev prismstumbler: add 0.7.4pre1
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
X-List-Received-Date: Tue, 03 Apr 2007 13:02:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> It would be best if upstream (prismstumbler in this case) would use proper versioning to
> start with, but if that is not possible we can paper over it in OE.

I do not agree... sure it might be better to have simpler versions but that's
not the point. I can change this in prismstumbler because I maintain it, but
this world is not perfect we will run into the same situation again with another
package. These "pre" versions are quite common and the documentation explains
how to handle these already so we should be able to teach our software to do the
same. That's way better then teaching users and even if it does not work in all
cases it is quite likely to be more reliable than having a guideline for it.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


