Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Kswfc-0005Rb-P3
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 11:39:56 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Kswpa-0006Rf-Uu
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 11:50:14 +0200
Message-ID: <4900464A.9090009@kernelconcepts.de>
Date: Thu, 23 Oct 2008 11:39:22 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gdfm8d$apg$1@ger.gmane.org>	<200810191847.04533.mickey@vanille-media.de>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
In-Reply-To: <1224438415.4235.266.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 0.95.0
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Thu, 23 Oct 2008 09:39:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Phil Blundell schrieb:
> It's long been my view that we should just add newer ones and leave the
> old ones alone.  There's really no reason to delete old recipes and,
> even if you check for PREFERRED_VERSIONs in the git tree, there is no
> real way to know who else might be relying on the version you are about
> to delete. 

I share this opinion. Since we do not know what people are doing with OE there
is no way to find out if a recipe is used or not. In fact I can imagine a lot of
situations in which you might want to use an older recipe.

Why do we delete old recipes? We do not do this with old software releases.


Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en


