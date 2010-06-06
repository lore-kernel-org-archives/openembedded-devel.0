Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OLLRl-00021C-6z
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 21:23:50 +0200
Received: by vws11 with SMTP id 11so1394019vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=ESynTOo3yoXm31b4E1AQCAMKGNwdl8Uv2m4Mfvw1JWU=;
	b=nNTDQ9j5YdzT1tBS6tTXFlt9Imd+lKMYV8kz18uz8IobAC2HcgF6vxTUwJFaUboFJg
	EBoTCf3BMN8gaRfqk8t46qJ/oSiffzUyYUeLxg9u89pNJYpUo1K27QYAOvRZeyvPVakC
	dYaeif8nF6hiF72enToH7YZ1WmDf3yTYEgjno=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=hXzUQ4KmvGQXSOUmblU4wzpyE6RMdnTxuGc3kppAtI2V0hhaakLn9zpFfJIM2tMRIX
	mvulcjcx7Fujz2ojQjhGW+WRdFhOYybjaZCMuirW3/REwkzf6ZydPeKz1cQ9TnytV70M
	Fy4CnxP1f71g3DXh8q0OBXQ0vHFLqssQ/UGHg=
Received: by 10.229.186.212 with SMTP id ct20mr4069527qcb.39.1275851969215; 
	Sun, 06 Jun 2010 12:19:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Sun, 6 Jun 2010 12:19:09 -0700 (PDT)
In-Reply-To: <hugq1i$olq$1@dough.gmane.org>
References: <alpine.DEB.2.00.1006061411390.3532@lynx>
	<hugq1i$olq$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 6 Jun 2010 12:19:09 -0700
X-Google-Sender-Auth: K9MCBPlrpPSQEUKxH4x8_en0lr0
Message-ID: <AANLkTimwz1pr4HKVubzUurl_Kqx9MXGbzJKTVQ4WnJjA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] matrix-gui, udev: Remove superfluous "patch=1" 	parameters.
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
X-List-Received-Date: Sun, 06 Jun 2010 19:23:50 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 6, 2010 at 11:39 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06-06-10 20:13, Robert P. J. Day wrote:
> >
> > Any file reference that has a suffix of ".diff" or ".patch" has no
> > need of a "patch=1" parameter.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> Acked-by: Koen Kooi <k-kooi@ti.com>
>

Acked-by: Chris Larson <clarson@kergoth.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

