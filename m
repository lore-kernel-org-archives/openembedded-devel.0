Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvaLW-0005Lx-Pf
	for Openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 20:07:26 +0100
Received: by fxm8 with SMTP id 8so2466816fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=OjCnd4iMOvXrj5F1DiPHc1VHJe1uu6gbqkXN9BLO1R4=;
	b=QEWTzXwc4dQolroewZU5FKH2BeViB/WpXJ7fZIZlmexuuIz6G6UUKL0vjyfatfZT6W
	0LzN38xfuJwvfSOhSInRajxaBWPuel+msUXqIAgrjJqZ+fafjns+uSOqo1ceEvEDGrDF
	nb1ADk9/dQ3lxm/BpLy1kjAsHcnMGCwcaTxs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=MJM8oVQPvx47Y7vPMK/H1SkhcI0X9AQefRTFf4N2pT2KbPzcwvkfpFbKfjIsVvswQi
	jyLmYyUSm2w1NXmqhY9SNVqUglLjNNvDYrNGQCWD7rY5gZNvOEl6j1Zpa79WU18Xw/u8
	jSyEROfV/5vk/LxWAmxhJpsbSLcM+GFe3jXwE=
Received: by 10.223.115.8 with SMTP id g8mr394561faq.55.1299265557079; Fri, 04
	Mar 2011 11:05:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Fri, 4 Mar 2011 11:05:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Mar 2011 11:05:15 -0800
Message-ID: <AANLkTinJ=gHz5m_gE8H_Vfcm22whb1q09FndjrbkdpZ-@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: SCALE 9x report
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
X-List-Received-Date: Fri, 04 Mar 2011 19:07:26 -0000
Content-Type: text/plain; charset=UTF-8

Hello

I was manning the OE booth at SCALE 9x in Los Angeles last Week
Saturday and Sunday. This was my first time at expo so I could not
compare how it has been in past years
but from hearing people who have been there before it is ever
increasing in its attendees and visitors. I being the lone soul at OE
booth had less time to go around and visit the
expo but I was relieved periodically thanks to Hunyue and Mike
Frysinger who would relieve me for some moments. Expo gives right mix
for corporations and opensource projects
in the exhibits.

We had a demo of qt4e-demo-image running on QEMU ARM. Another demo was
running console-image on 6 different qemu images for ARM x86 PPC MIPS
MIPS64 and SH4 and each one of them being connected over Ethernet. A
fantastic demo was arranged by Hunyue at the Spot where he displayed
custom designed Tablet built on beagleboard
running angstrom and this little device brought more than expected
people visiting our booth. I could not show off the demo on efikaMX
that I had since we could not arrange for a display with HDMI. Many of
the visitors did not know OE but they knew devices which were powered
by
OE. They were very happy at the technology show case and learning the
technology behind those devices. Webos Internals had a lot bigger
booth and lot more people visiting them
they also displayed the OE powered logo (old one) on their banner
which I thought was cool. Many of the visitors to the booth were
essentially interested in Embedded Linux and how it goes into devices
and learning the process and technologies deployed to do it. There
were few visitors who have worked on OE directly or indirectly.

I met folks that I have been working with for years for first time. It
was nice to meet them and discuss things face to face. I talked to
Libreoffice folks and discussed having a mobile version of Libreoffice
and they were interested to take it back to their mailing lists and
discuss more.

I would like to thank Cliff Brake for working hard and devoting time
for revamping the OE poster and sponsoring it. Florian, Mickey,
Marcin, Leon, Philip, Robert sharing the material
and their past booth organising experiences. Hunyue Yau for helping me
through out the expo. Tom King for making it all happen and arrange
the OE booth at the Expo.

I hope that more of OE people can make it to this expo next year and
we could become regular attendees at SCALE

Thanks
-Khem


