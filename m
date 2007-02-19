Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HJBMj-0004Nj-6t
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 17:27:49 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1HJBWU-0006lX-87
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Feb 2007 17:37:55 +0100
Message-ID: <45D9CFF7.8060502@kernelconcepts.de>
Date: Mon, 19 Feb 2007 17:27:35 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.9 (X11/20070104)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1HFb2e-0007GK-Jp@linuxtogo.org>
In-Reply-To: <E1HFb2e-0007GK-Jp@linuxtogo.org>
X-Enigmail-Version: 0.94.0.0
Subject: Re: [oe-commits] org.oe.dev xserver-common 1.13: Re-add	calibrate-only-if-ts.patch after merge.
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
X-List-Received-Date: Mon, 19 Feb 2007 16:27:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

pfalcon commit schrieb:
> xserver-common 1.13: Re-add calibrate-only-if-ts.patch after merge.

that's a very good idea but I am sure the patch will break calibration on quite
some devices because the device might have a different name. Maybe use
detect-stylus for this purpose.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-14
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


