Received: from [217.150.241.23] (helo=webmail.nine.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mailinglist@miromico.ch>) id 1KqwmS-0008T9-HI
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 23:22:44 +0200
Received: by webmail.nine.ch (Postfix, from userid 33)
	id 854261010335; Fri, 17 Oct 2008 23:22:38 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Date: Fri, 17 Oct 2008 23:22:38 +0200
From: <mailinglist@miromico.ch>
In-Reply-To: <48F8745B.2030001@gmx.net>
References: <48F825DE.90104@miromico.ch> <48F8745B.2030001@gmx.net>
Message-ID: <449dbc2c021997d20314e77536d2f770@mail.nine.ch>
X-Sender: mailinglist@miromico.ch
User-Agent: RoundCube Webmail/0.1
Subject: Re: Adding support for our
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
X-List-Received-Date: Fri, 17 Oct 2008 21:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Hi, =0D
=0D
>> We have a new AVR32 based embedded linux board=0D
> (www.miromico.com/hammerhead), which is available now. =0D
> That is a nice little board you have there. I personally like the AVR32=
=0D
> architecture. Atmel also has the better policy when it comes to=0D
> specifications. So I really like to see more AVR32 being used. :)=0D
=0D
Thanks.=0D
> =0D
>> We would like to use OpenEmbedded as our major build system to allow o=
ur=0D
> customers to build their u-boot, =0D
>> kernel and rootfs.=0D
> Great stuff. OE already supports the ATNGW100 (have one here) and the=0D
> AT32STK1000. If your board can boot with the same linux 2.6.24 (or with=
=0D
> patches to that) it will be quite easy to support your device.=0D
=0D
Yes, I know. I have an ATNGW100 as well. The problem is, that the oe for=0D
atngw100 =0D
fails. It does compile (console-image), but I can't boot. I get a segfaul=
t=0D
in init (sysvinit).=0D
=0D
> =0D
>> Is there such a thing as a board maintainer in oe? If yes, how can we=0D
> become one?=0D
> We have a "MAINTAINERS" file. If you are a contributor you can add=0D
> information about the machines you are maintaining. This mainly means=0D
> that people will ask you when stuff breaks. In theory it should also=0D
> mean that people will ask you *first* if things are changed in OE that=0D
> affect your device but AFAIK we have no strict policies regarding this.=
=0D
=0D
Ok, I'll check that out...=0D
=0D
Alex



