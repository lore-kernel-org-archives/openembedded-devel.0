Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LrTWr-0006mz-N1
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 10:53:08 +0200
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 5F2DFD4808C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 10:50:01 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 6ED2DD4813F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 10:49:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 163D5184007
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2009 10:50:03 +0200 (CEST)
Message-ID: <49DC653A.5090804@bolloretelecom.eu>
Date: Wed, 08 Apr 2009 10:50:02 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49DA2F2C.60008@bolloretelecom.eu>	<19c1b8a90904061449s1cc1c4e6pb1c04f2c71cc6beb@mail.gmail.com>	<1239096233.16991.525.camel@mill.internal.reciva.com>
	<d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
In-Reply-To: <d1b08f940904070841y3d7ca01erae4a50625faff158@mail.gmail.com>
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Wed, 08 Apr 2009 08:53:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As requested I have fixed the following packages which were not respectin=
g LDFLAGS.

* irda-utils
* hostap-utils
* ppp
* obexpush

For the other QA errors I'd rather someone else handled it.

--=20
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris


