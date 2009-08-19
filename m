Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mdnzs-0007fa-4O
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 18:26:48 +0200
Received: by fxm24 with SMTP id 24so2260925fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2009 09:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YUtGGJ9+4I4rWC7Oyrp7obTvFUh+QWgdE7jXaV7rt/0=;
	b=GKxBwCLe1G0NLUQaqMqicglpo9X3q1HQfd2OO5+C+FHvg1QjmR0ALa2D49oHCLwoT9
	vY97EdSt1UrDLux1lohw45CapFzfpRiqAYS92TUd7DOM9aH/Cfj0cyKRhpqBrxbiVF/r
	plBY7HZ+d5+kQCCSrdIw2+0vU7NDQiiXxEAXQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VjLcfc3RYYISQgcbrWo2eSSKwJKqeACFv/NJiWX+zy8t+QUa+7iqslQNZ6l4kFq+cA
	eclFGZoY8wurlcoB5jiY9sSuRs70vbp3Ly5CAC2pNh3y3xT+wSv5klG40isiX2gdHqqS
	agUAca7Gvq3nlpWQSqmRYdAwP1dcjOoTqe9Iw=
MIME-Version: 1.0
Received: by 10.239.168.211 with SMTP id l19mr549802hbe.119.1250698174730; 
	Wed, 19 Aug 2009 09:09:34 -0700 (PDT)
In-Reply-To: <4A8C1EB7.4050500@atmel.com>
References: <4A8C1EB7.4050500@atmel.com>
Date: Wed, 19 Aug 2009 18:09:34 +0200
Message-ID: <c384c5ea0908190909t2bed0a97x617f507392422e61@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fbv neutered
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
X-List-Received-Date: Wed, 19 Aug 2009 16:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Ulf,

On Wed, Aug 19, 2009 at 5:48 PM, Ulf Samuelsson<ulf.samuelsson@atmel.com> w=
rote:
> I added "fbv" "frame buffer viewer" to the file system,
> and happily tried to watch my Mustang rental car.
>
> -- fbv did not recognize the file format.
>
Tried --enable-mustang? :-)

> ---------------------------------
> =A0 =A0 =A0 =A0CC=3D"${CC}" ./configure --without-libungif --without-bmp =
\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--without-libjpeg
> ---------------------------------
>
> Beats me why someone would want to have it built this way.
>
Minimalistic, yeah baby!  Probably PNG support is there.

> Is there another application one should use?
>
Use an overlay, tweak the recipe to your needs.

Regards,
--=20
Leon


