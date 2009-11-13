Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N94qS-0004pX-TE
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 23:42:24 +0100
Received: from [192.168.1.105] (e180136081.adsl.alicedsl.de [85.180.136.81])
	by drlauer-research.com (Postfix) with ESMTP id ADD2E5847FB;
	Sat, 14 Nov 2009 00:27:09 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1258130362.5799.80.camel@dax.rpnet.com>
References: <alpine.LFD.2.00.0911130443520.1157@localhost>
	<4AFD4DD6.70509@balister.org>
	<alpine.LFD.2.00.0911130732220.17745@localhost>
	<4AFD5440.6080202@balister.org>
	<1258129007.5799.73.camel@dax.rpnet.com>
	<alpine.LFD.2.00.0911131129020.5980@localhost>
	<1258130362.5799.80.camel@dax.rpnet.com>
Organization: Vanille-Media
Date: Fri, 13 Nov 2009 23:41:32 +0100
Message-ID: <1258152092.13901.11.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Fri, 13 Nov 2009 22:42:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi folks,

> That readline tweak is a hack and there is a bigger problem here. I'd
> like to solve it completely so yes, I'd like to confirm that was the
> problem please. Once someone has done that I also have a proposed fix:
> 
> http://tim.rpsys.net/python-hostfix.patch

Acked-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>

:M:




