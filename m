Received: from [209.85.217.177] (helo=mail-gx0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M0auu-0001cr-Je
	for openembedded-devel@openembedded.org; Sun, 03 May 2009 14:35:39 +0200
Received: by gxk25 with SMTP id 25so5906629gxk.12
	for <openembedded-devel@openembedded.org>;
	Sun, 03 May 2009 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=kPOm1M4uJuZA0k90rLujaTxdUkEA8TrVhz8hLsyIe0k=;
	b=jiovLa3ZLvZCwDjZ8o+eu+7soo9MfJhwtMpzeSx38bmSII3FN5HDL3F31UghIFVinr
	mMKfVYnlgmhgaR9d0U1toaZDWuPkSgaEQy6WuDXFEq4PweMO9OWwodLSonCtSi3UbPCy
	AHa7YGPeZg4WOVGaXRtck4J//BqwbXsT6/tu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=gq01SOdXlAExhWvum6IoLfA1MDK19yRHnxF6dow721vNkDiK5PczcGHCWd//rcjkeh
	09egMkyjHlm2OphwtEGRK6z1yD8+fIVhBtOOAXxWunHTtHIRkW5AgZbSSIrpRlLW+Y13
	YtLj1rclnXCmQGVe0qlp9NEZD7U8XWVWhewGE=
MIME-Version: 1.0
Received: by 10.90.118.8 with SMTP id q8mr4275544agc.40.1241353793821; Sun, 03 
	May 2009 05:29:53 -0700 (PDT)
In-Reply-To: <49FCA524.10102@dls.net>
References: <20090427141943.GG18788@smtp.west.cox.net>
	<20090429161224.GB18788@smtp.west.cox.net> <49FCA524.10102@dls.net>
Date: Sun, 3 May 2009 14:29:53 +0200
Message-ID: <c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Sun, 03 May 2009 12:35:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 2, 2009 at 9:55 PM, Mike (mwester) <mwester@dls.net> wrote:
> Acked-by: Mike Westerhof <mwester@dls.net>
>
I think we can add this functionality now.

By the recent merge of "micro.conf" and "micro-uclibc.conf", a new
TODO is to merge the LIBC feature into micro distro as well.
See "[oe] Pull request from Dor=E9Development - New: Micro distro/image"


Regards,
--=20
Leon


