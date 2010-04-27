Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1O6mGi-0004hb-N1
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 17:00:14 +0200
Received: by fxm11 with SMTP id 11so259618fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 07:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hq4xFl+MbYc1toX5ucc3bCO+bO4ptaT5r5R8CaNZaF0=;
	b=H7VgZlGgzbmIrJe1X98AqCOCXOsp5dOqwuVlGvOv3uMqc6jk24BwML1QCyaWMKYmn1
	sGbbNyu3ydbgPEQXgFVgKK2AevQiuE1FPP3z6YJbgkYCP7rfyvTubgEqqqHvabiUjS7/
	hNyNqrFdL7SSoCfDqfBEpf5DKnHYWqRqXv0WU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=HfNvLtoJNizXgCte4WetVyhrkYzWc3z05AFRe2qz2L2uPA8WaXqjKX6m5OTdtogyGw
	RUXpi1OUKgnGzQ6BPw7sRTIRoKhtyrS0MnHrhmqgsaUGHirGTn6JGSH+JSIxn1l4LFSj
	Q9bNm9Z4gJ2lEBAg1z5/iddEs40Y8AP7WqJOQ=
MIME-Version: 1.0
Received: by 10.223.92.136 with SMTP id r8mr22507fam.40.1272380192232; Tue, 27 
	Apr 2010 07:56:32 -0700 (PDT)
Received: by 10.223.106.136 with HTTP; Tue, 27 Apr 2010 07:56:32 -0700 (PDT)
In-Reply-To: <hr6sqi$avd$1@dough.gmane.org>
References: <openembedded-devel@lists.openembedded.org>
	<1272378556-21914-1-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-2-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-3-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-4-git-send-email-aalonso00@gmail.com>
	<1272378556-21914-5-git-send-email-aalonso00@gmail.com>
	<hr6sqi$avd$1@dough.gmane.org>
Date: Tue, 27 Apr 2010 09:56:32 -0500
Message-ID: <m2id1ded4381004270756u5e50fcacz894c9e04d42bd7cc@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 5/5] xorg.conf: new file
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
X-List-Received-Date: Tue, 27 Apr 2010 15:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ooops forgot about it, a patch should be in patch queue

Regards

On Tue, Apr 27, 2010 at 9:37 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> You forgot to bump PR
>
> On 27-04-10 16:29, Adrian Alonso wrote:
> > * xorg config file for xilinx ml507 platform
> >
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
> > ---
> >  .../xserver-xorg-conf/xilinx-ml507/xorg.conf       |   39
> ++++++++++++++++++++
> >  1 files changed, 39 insertions(+), 0 deletions(-)
> >  create mode 100644
> recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> >
> > diff --git
> a/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> > new file mode 100644
> > index 0000000..aca5eed
> > --- /dev/null
> > +++ b/recipes/xorg-xserver/xserver-xorg-conf/xilinx-ml507/xorg.conf
> > @@ -0,0 +1,39 @@
> > +Section "Monitor"
> > +     Identifier "LCD Panel"
> > +EndSection
> > +
> > +Section "Device"
> > +    Identifier  "Xilinx frame buffer"
> > +    Driver      "fbdev"
> > +EndSection
> > +
> > +Section "Screen"
> > +    Identifier  "Default Screen"
> > +    Device      "Xilinx frame buffer"
> > +    Monitor     "LCD Panel"
> > +     SubSection "Display"
> > +             Depth   24
> > +        Modes   "640x480"
> > +     EndSubSection
> > +EndSection
> > +
> > +Section "InputDevice"
> > +    Identifier  "Keyboard"
> > +    Driver      "kbd"
> > +#    Option      "XkbLayout" "es"
> > +#    Option      "XkbModel"  "pc105"
> > +EndSection
> > +
> > +Section "InputDevice"
> > +    Identifier  "Mouse"
> > +    Driver      "mouse"
> > +    Option      "protocol" "auto"
> > +    Option      "device" "/dev/input/mice"
> > +EndSection
> > +
> > +Section "ServerLayout"
> > +    Identifier  "Default Layout"
> > +    Screen      "Default Screen"
> > +    InputDevice "Keyboard"
> > +    InputDevice "Mouse"
> > +EndSection
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL1vaSMkyGM64RGpERAuQbAKC3g5s4J24uJArBtpoDsdOQ8wrP+QCfYRD3
> b/DSHTFPDR6Z81V1UP8WHoc=
> =enXg
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

