Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MBzF3-0007ay-U5
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 00:47:30 +0200
Received: from [78.49.77.53] (helo=[192.168.1.6])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1MBzBr-0001zK-BU
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 00:44:11 +0200
Message-ID: <4A26FB66.8020203@kernelconcepts.de>
Date: Thu, 04 Jun 2009 00:38:30 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A26ACDA.2060806@kernelconcepts.de>
	<1244060602.5049.64.camel@lenovo.internal.reciva.com>
In-Reply-To: <1244060602.5049.64.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 0.95.7
Subject: Re: [RFC] gtk+ and gdk-pixbuf
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
X-List-Received-Date: Wed, 03 Jun 2009 22:47:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Phil Blundell schrieb:
> Adding PROVIDES = "gdk-pixbuf" to gtk would probably clear it up.  I
> don't think bitbake really understands conflicts so that's probably as
> good as it gets.

yes indeed, that's a good idea. I'll do it in this way.

Greetings

Florian


-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


