Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sinestado@gmail.com>) id 1MhWrw-0000yH-2N
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 00:58:00 +0200
Received: by ewy19 with SMTP id 19so3844049ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Xl0x0wAfHxbWjoy03zmo4pBCe5HM9QtKWosZwfSD+aY=;
	b=fd547HR95Yzf913xiA44Gh22kZy0duU41trjSjtGi60if7M+yAcrhD/9CusyL1sPy2
	vPEw1uhEcCaLyAYaurdECM4qKGyAmHyiIWjVacjkMTlBIJynLiwYDIVJUxIcAbvHDy52
	8uI/RF3wxeGAtF8jQwldZU6pxtoTAO7hVEf0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FJWfHpxvPQAU46XS2dvKR9N7tu0zHD4i0s8qdjvE13ErcVNbSB9O8e3WS9sJqkLLJG
	K0uBq40D/sK5O1QG0b8b/VHZu41PK/yDIqBOMmxgbb89qlcIhso8LryneG/yXM0SXxIE
	QtZIDMt8DLBbdvA7mOMh03xrBs5sqa+pMEw9o=
MIME-Version: 1.0
Received: by 10.216.90.76 with SMTP id d54mr654279wef.55.1251585578452; Sat, 
	29 Aug 2009 15:39:38 -0700 (PDT)
In-Reply-To: <19c1b8a90908281524m6c00b34eg7eb8fca9652a74f@mail.gmail.com>
References: <a63ecaf0908281452x12ab1a84w9df0b4a9e0f98163@mail.gmail.com>
	<19c1b8a90908281524m6c00b34eg7eb8fca9652a74f@mail.gmail.com>
Date: Sat, 29 Aug 2009 19:39:38 -0300
Message-ID: <a63ecaf0908291539w658d9484r5d0d4b82dc041ab@mail.gmail.com>
From: Sushi Sensei <sinestado@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Error with xterm_207.bb in Fedora
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
X-List-Received-Date: Sat, 29 Aug 2009 22:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Txs Khem!

How I can to requesta a git account?



2009/8/28 Khem Raj <raj.khem@gmail.com>

> On Fri, Aug 28, 2009 at 2:52 PM, Sushi Sensei<sinestado@gmail.com> wrote:
> > There are an error when try to select the mode for install:
> > A patch for sinstall.sh will be added
> > For example, changing line 120:
> >
> > PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e
> 's/r-./5/g'
> > -e 's/--[sxt]/1/g'`
> >
> > for:
> >
> > PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e
> 's/r-./5/g'
> > -e 's/--[sxt]/1/g'|tr -d '.'`
> >
> >
> > I don't know to who send this "patch"
>
>
> git-format it nicely and send it to very same list.
>
> http://wiki.openembedded.net/index.php/User_contributions
>
>
> Thx
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------

