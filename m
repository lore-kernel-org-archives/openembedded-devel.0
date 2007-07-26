Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IE3pY-0005Ri-A2
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2007 15:56:40 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 856E728C013; Thu, 26 Jul 2007 15:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180156235.adsl.alicedsl.de [85.180.156.235])
	by srv043.dedi23.de (Postfix) with ESMTP id C6E8528C012
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 15:53:26 +0200 (CEST)
Date: Thu, 26 Jul 2007 15:55:18 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1125663146.20070726155518@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46A895A1.7040400@dominion.kabel.utwente.nl>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
	<46A895A1.7040400@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Thu, 26 Jul 2007 13:56:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Koen Kooi schreef:
>> Hi,
>> 
>> At guadec we discussed activating autoconf-native 2.61, pkgconfig-native 0.22 and
>> m4-native 1.4.8. The test builds we did didn't show any errors but we'd like more people
>> to try to build their favourite target and report back.

> After multiple success reports I'd like to propose the following timeline:

> 20070802: make m4-native 1.4.8 the default
> 20070809: make autoconf-native 2.61 the default
> 20070816: make pkgconfig-native 0.22 the default
> 20070816+: remove autotools hacks in recipes (e.g overriding do_configure)

> what do you think?

Sounds good, +1 from me.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



