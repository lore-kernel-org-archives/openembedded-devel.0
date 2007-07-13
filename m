Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cayco@poczta.cayco.pl>) id 1I9FKO-0007a2-KU
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2007 09:12:36 +0200
Received: by ug-out-1314.google.com with SMTP id i24so530270ugd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2007 00:12:34 -0700 (PDT)
Received: by 10.82.170.2 with SMTP id s2mr1536419bue.1184310753435;
	Fri, 13 Jul 2007 00:12:33 -0700 (PDT)
Received: by 10.82.148.14 with HTTP; Fri, 13 Jul 2007 00:12:33 -0700 (PDT)
Message-ID: <193a0cf50707130012l763ecdb2i7a56ff23ea9a575b@mail.gmail.com>
Date: Fri, 13 Jul 2007 09:12:33 +0200
From: "Krzysztof Kajkowski" <cayco@poczta.cayco.pl>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <860C48AB-BFEE-414D-9275-B20556FA10B7@selfish.org>
MIME-Version: 1.0
References: <193a0cf50707121105y703147cbr935d6a603d01e6d6@mail.gmail.com>
	<860C48AB-BFEE-414D-9275-B20556FA10B7@selfish.org>
Subject: Re: ipkg on MacOS X (missing feature.h)
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
X-List-Received-Date: Fri, 13 Jul 2007 07:12:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2007/7/12, Holger Freyther <zecke@selfish.org>:
>
> Am 12.07.2007 um 20:05 schrieb Krzysztof Kajkowski:
>
> > Hello everyone!
> >
> > I am trying to set up OpenMoko environment on my Macbook - you can see
> > my efforts on  http://wiki.openmoko.org/wiki/
> > OpenMoko_under_QEMU_on_MacOSX
> >
> > Now I'm struggling with compiling ipkg. Here's my log:
> >
>
> Check the OE wiki for building on non Linux. Go to the viewcvs of
> handhelds.org for ipkg and check my old patch which was backed out.
> Basicly features.h is a glibc (or was it gcc on linux?) thing and is
> in (lib)busybox only to detect libc5.

OMG, I give up - I cannot find anything you said! I looked into wiki
pages but I could find any non-Linux instructions... I searched google
(site:handhelds.org) with different keywords such as freyther, zecke,
ipkg, viewvcvs but I found none.

Do you have any other clue how can I find your patch?

cheers

cayco


