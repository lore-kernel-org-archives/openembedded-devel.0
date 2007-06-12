Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Hy303-0002DY-CN
	for openembedded-devel@openembedded.org; Tue, 12 Jun 2007 11:49:19 +0200
Received: from dias (62.169.217.209) by memova2.tellas.gr (7.3.118.8)
	id 4638635B00D811A3 for openembedded-devel@openembedded.org;
	Tue, 12 Jun 2007 11:45:23 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 12 Jun 2007 12:46:23 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHEEEHLFAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <f96d234e0706111306o57e72d0bs4bda73c2e20018b5@mail.gmail.com>
Importance: Normal
Subject: Re: Gumstix machine support
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
X-List-Received-Date: Tue, 12 Jun 2007 09:49:19 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> >          There's also a problem when building images in that the
> > "mkimage" command doesn't get installed, so I've been putting it
> > elsewhere and adding it to my PATH.
>
> I think U-boot build installs mkimage into the staging directory, so
> this issue should go away when you get your U-boot builds working.
>

Yes it does install mkimage
Magicbox and dht-walnut kernels process the kernel image with mkimage in
order to output a u-boot "readable" image

I've be thinking of turning this into a class as there are more and more
machines in OE that use u-boot and could benefit of something like that and
people would not have to re-invent the wheel every time


Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com






