Received: from [209.242.20.70] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1HbHor-0007MA-9d
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Apr 2007 16:59:41 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 1DFC44122A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2007 09:59:44 -0500 (CDT)
Message-ID: <009901c77b80$b9b02e70$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <evcm2e$15q$1@sea.gmane.org>	<1176155636.5842.25.camel@localhost.localdomain>	<432beae0704091515n6a55a294jfdf64c9e855b9537@mail.gmail.com>	<3ef3a7ad0704100602v610f6c10k447a1551f79ca750@mail.gmail.com><1176215946.5809.90.camel@localhost.localdomain>
	<461BA347.5060908@gmail.com>
Date: Tue, 10 Apr 2007 09:58:40 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Tue, 10 Apr 2007 14:59:41 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


>> Can someone make sanity.bbclass detect dash and exit with a
>> warning/error? :)
>
> Probably better is to make bash-native and depend on it?
> (or ash)
> Just curious.

Ack! OE already builds a lot of stuff natively -- there's no need to slow
builds done even more by building something natively that one should be able
to presume exists on every reasonable build machine.  I think if a build
machine has gcc, it shouldn't be too much more difficult to expect a working
bash as well, IMO.

Mike (mwester)




