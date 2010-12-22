Received: from zmta01.irigo.dk ([193.200.44.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eha@doredevelopment.dk>) id 1PVHcM-0007rr-BP
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 06:52:06 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zmta01.irigo.dk (Postfix) with ESMTP id A982E14319F81
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 06:43:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at zmta01.irigo.dk
Received: from zmta01.irigo.dk ([127.0.0.1])
	by localhost (zmta01.irigo.dk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqwFcfpiRXUm
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 06:43:10 +0100 (CET)
Received: from [192.168.1.21] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by zmta01.irigo.dk (Postfix) with ESMTP id 72B88142C1AB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 06:43:10 +0100 (CET)
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
References: <ienu66$5gf$1@dough.gmane.org> <4D0F8AB7.1020104@xora.org.uk>
	<AANLkTiks4PYZxZCQgsprveY1jNQgpy_mMVTOwg3DtsqX@mail.gmail.com>
	<iepnom$tk9$1@dough.gmane.org>
	<AANLkTimv-=g7qhYQynPYi65Vp2sQk_a6mPUsVbh-M0eA@mail.gmail.com>
Organization: =?ISO-8859-1?Q?Dor=E9Development?= ApS
Date: Wed, 22 Dec 2010 06:43:09 +0100
Message-ID: <1292996589.13721.1.camel@eha>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [RFC] meta-openembedded layer for yocto hosted on oe.org
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
X-List-Received-Date: Wed, 22 Dec 2010 05:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-12-21 at 18:51 +0100, Frans Meulenbroeks wrote:

> That leaves the question:
> Given the existence of Yocto in which parts do we see added value of
> OE and on which things should we as OE focus.
> But I guess this is more something for a different thread.

With or without Yocto, it seems like a good question to ask what we
would like to see improved in OE, ie. what would we like to see go into
OE within the next 1-2 years.

With that in mind, it should be somewhat easier to find out how to guide
OE community directions with relation to Yocto project.

I personally have the feeling that Yocto project have been given the
man-power to brute-force improve the quality of Poky/OpenEmbedded on a
day-by-day basis, and I expect they will be doing a good job at that.

One attractive direction of OE development would in my opinion to look a
bit further into the future, and work on fundamental improvements on
selected focus areas.

I imagine that Yocto will be expected to deliver continuous stream of
improvements to Poky, and will in practise be restricted to development
in microsteps of improvements.  Any improvements to OE that will require
a break in this continous stream is therefore something that OE might be
able to add value compared to what Yocto will deliver.

Of-course, I might just be beating a dead horse...

/Esben




