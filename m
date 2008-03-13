Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JZm0Z-0004CE-Pr; Thu, 13 Mar 2008 12:54:05 +0100
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1JZmU1-0001cz-OH; Thu, 13 Mar 2008 13:24:29 +0100
Message-ID: <47D91563.8020702@kernelconcepts.de>
Date: Thu, 13 Mar 2008 12:52:03 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200803110807.11368.zecke@selfish.org>	<20080311114938.GM30267@ibawizard.net>	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>	<20080311145739.GN30267@ibawizard.net>	<1205250588.4521.111.camel@dax.rpnet.com>	<20080312014945.4783ae6a@widy.localdomain>	<1205280598.16531.26.camel@dax.rpnet.com>	<20080312024408.44d9192e@widy.localdomain>	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>	<fr997r$aat$1@ger.gmane.org>	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>	<1205358843.4530.22.camel@dax.rpnet.com>	<fr9n05$sm7$1@ger.gmane.org>	<1205369061.4530.65.camel@dax.rpnet.com>
	<fraq1i$k6k$1@ger.gmane.org>
In-Reply-To: <fraq1i$k6k$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-SA-Exim-Connect-IP: 212.60.202.196
X-SA-Exim-Mail-From: florian.boor@kernelconcepts.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 11:54:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> The problem is that mtn developers fail to accept that silently merging
> node-ids is OK when the *contents* are the same.

... and even if the contents were not the same you could try a merge. These
things make mtn a bad choice. In combination with bad error handling it makes it
a pain.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


