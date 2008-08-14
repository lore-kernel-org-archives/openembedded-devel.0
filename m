Received: from [212.60.202.196] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1KTZEL-0006r9-F6
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Aug 2008 11:34:53 +0200
Received: from [192.168.2.131] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1KTZEf-00046v-HM
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Aug 2008 11:35:13 +0200
Message-ID: <48A3FC12.8060705@kernelconcepts.de>
Date: Thu, 14 Aug 2008 11:34:10 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <g7vqvs$3fi$1@ger.gmane.org>
In-Reply-To: <g7vqvs$3fi$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 09:34:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Rolf Leggewie schrieb:
> "git checkout $branch".  This can easily corrupt tmp/ and I fear it will
> happen quite often.  I wonder if there is anything OE/bitbake can do to
> alleviate the pain.

well, you can't stop people from shooting themselves in their feet entirely. Its
even easier changing your package repository between multiple branches changing
the path in environment or local.conf. Do you want to prevent people from doing
this too?
I do not say the situation is ideal, but if we want to start working on
usability issues we should start with more important ones.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


