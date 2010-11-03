Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PDfjs-0007XB-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 16:59:04 +0100
Received: by ewy2 with SMTP id 2so350281ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=h6Educ9EU01H5xbYJS611uCax84CzJDhw9eSTYYqKGo=;
	b=ClvUMLe59IrXrvTBg/7+gjAT8xtAIBQPYmhmZ5hAcdL2dLRYmZy1d0Ps7TZaF061BC
	asGSVhi6A4dBxvM4c08M3sWIDASj5UxIdG2kc06q/+vFokJWPmu+WokBl7W0Xrrb6pBd
	vnUrTMP+hJ7gciUUmvqNRYEurFKpRdECI+lSw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=RX9NI7Rk428eArs4d6Zrubc9VnI8UCwe60VVVd5oObGxazJFOppbhXYWnhZc/E3oyP
	gYBQawbuuEgCrkt72sFWUmW7zkx3uM9sQRz9SiJw655sgIj1DmZCF2icRu+pc2zvsOuz
	sWlnuQrEbevkq985J20t8GUcqD3MDegjmcKaA=
MIME-Version: 1.0
Received: by 10.216.60.203 with SMTP id u53mr18540786wec.36.1288799895308;
	Wed, 03 Nov 2010 08:58:15 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Wed, 3 Nov 2010 08:58:14 -0700 (PDT)
In-Reply-To: <AANLkTi=iKpceASBeqeGcnu6p7uAOiaymA51o7t7VyAUS@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
	<AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
	<20101101194703.GA12018@gmail.com>
	<AANLkTi=TyPX5L5oUHYehsuvqr9FGSCaD_nj1Z8+P=8F_@mail.gmail.com>
	<20101101195748.GB12018@gmail.com>
	<AANLkTikr3k3+5fJhX9MfKF2DhSbEXn8Pa9SF0QZ6nCZ7@mail.gmail.com>
	<AANLkTimOLodSjV8+saSi1td==O7TgX1iqzJeQ=NT5mgB@mail.gmail.com>
	<AANLkTi=LRGff3rc0++-+2PAKMWLitWZWOC3TGTUO4kYQ@mail.gmail.com>
	<AANLkTi=a3=QB-NGyLi5samZ2epFYGgw3_HKctN32L=vd@mail.gmail.com>
	<AANLkTi=iKpceASBeqeGcnu6p7uAOiaymA51o7t7VyAUS@mail.gmail.com>
Date: Wed, 3 Nov 2010 11:58:14 -0400
X-Google-Sender-Auth: ZNnRppwYO6364hBln8sidPRoqlM
Message-ID: <AANLkTikJgfY+km1HdYpDLELrz73QGZFLsvXr346y2h7p@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Wed, 03 Nov 2010 15:59:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2010 at 12:50 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Nov 2, 2010 at 8:10 PM, Zach Frey <zach@znfrey.com> wrote:
> > On Tue, Nov 2, 2010 at 10:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> > A question -- is the build supposed to be using the build host's
> >> automake,
> >> > or is it supposed to be using one from its downloaded toolchain?
> >>
> >> well automake is used from the contained versions. We use the version
> >> from native staging which
> >> is the version we build. The automake installed on your host is not
> >> used unless you do some stuff
> >> with assume provided.
> >>
> >>
> > From
> >
> $OEBASE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backend=
s-2.10.1-r0/temp/run.do_compile.12625
> >
> >                        AUTOV=3D`automake --version |head -n 1 |sed "s/.=
*
> > //;s/\.[0-9]\+$//"`
> >                        automake --version
> >                        echo "AUTOV is $AUTOV"
> >
> > As far as I can tell, this will pick up the host, not the contained
> version.
> >
> > Tried to understand where this is spelled out in the recipe, but not
> seeing
> > it (afraid I'm new to this).
> >
>
> Well see where the PATHS are set in the script.
>
>
export
PATH=3D"/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/armv7a/bi=
n:/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/sbin:/home/PHOE=
NIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/bin:/home/PHOENIX/frey/OE/b=
uild/tmp/sysroots/x86_64-linux/sbin:/home/PHOENIX/frey/OE/build/tmp/sysroot=
s/x86_64-linux//bin:/home/PHOENIX/frey/OE/bitbake/bin:/opt/bin:/usr/local/s=
bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"


Which looks like it ought to be right... if that PATH is truly in effect,
then /home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/bin/automake
ought to be found before /usr/bin/automake.


Thanks,
Zach

