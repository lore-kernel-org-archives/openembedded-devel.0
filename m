Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LjxiL-0001uQ-RD
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 16:30:06 +0100
Received: from andromeda.vanille.de (e180186009.adsl.alicedsl.de
	[85.180.186.9])
	by drlauer-research.com (Postfix) with ESMTP id 11B9C58412A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2009 16:54:56 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2009 16:29:02 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.27-11-generic; KDE/4.2.0; x86_64; ; )
References: <49BFA406.6030802@bolloretelecom.eu>
	<20090317171705.208a7d31@kmfms> <49C107E3.30505@bolloretelecom.eu>
In-Reply-To: <49C107E3.30505@bolloretelecom.eu>
MIME-Version: 1.0
Message-Id: <200903181629.02331.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Wed, 18 Mar 2009 15:30:10 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 18 March 2009 15:40:35 Jeremy Lain=C3=A9 wrote:
> To my knowledge qmake support has been busted for a while (I also have
> your problem if I try to build a qmake-based package), I'm suprised
> this hasn't cropped up earlier.
>
> I'll try to look into it, but I don't quite understand the way
> "qmake2-native" is packaged (why is it a "cross" package?), and where
> the "mkspecs" directories end up.
>
> If someone can help shed some light on this, I'm all ears!

I can't, but I reverted this part some weeks ago and since then all my Qt a=
pps=20
are building again :)

=2D-=20
:M:



