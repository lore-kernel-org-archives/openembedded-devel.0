Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1HYISE-0002jC-4S
	for openembedded-devel@openembedded.org; Mon, 02 Apr 2007 11:03:59 +0200
Received: from [212.60.202.194] (helo=[192.168.2.131])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50)
	id 1HYIjv-0000Z8-BB; Mon, 02 Apr 2007 11:22:15 +0200
Message-ID: <4610C6E6.30102@kernelconcepts.de>
Date: Mon, 02 Apr 2007 11:03:34 +0200
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
MIME-Version: 1.0
To: koen@dominion.kabel.utwente.nl
References: <E1HXnn8-0007Dx-JK@linuxtogo.org>
	<460F5F87.3060403@dominion.kabel.utwente.nl>
In-Reply-To: <460F5F87.3060403@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Mon, 02 Apr 2007 09:04:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi schrieb:
> That is against our versioning policy, this way you can't upgrade to 0.7.4 when it gets
> released[1]. Use _0.7.3+0.7.4pre1 instead.

I remember we had these kind of trouble with ipkg before. Wouldn't it be better
to make it possible to handle this properly? I guess we will run into this again
and again in future.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de

1D78 2D4D 6C53 1CA4 5588  D07B A8E7 940C 25B7 9A76


