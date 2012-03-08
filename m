Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S5fzT-0001a5-Fx
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 17:14:55 +0100
Received: by yenm3 with SMTP id m3so289902yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2012 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=aRCNW2je2CDxeJgExxFwy8SpWi0IE0OH/ufpCFuHz98=;
	b=lWphE1tgfOAdNbTP+SBegYY+v+/pSyfjAZdn1ZwoS1Snhz1vBg2UXs1eClFaPENI7A
	q3Hfh4XYcAuiHWu4lb51NefUu5fX+SocnTHwcc6Q7zY6YvoEWZRqQgCpHlHZiwCRpat7
	z53ozxKHDSwhFEENdznAAHWKq2VfVjGN3Nhsr02XdBgqyLqFzxJjtbUYo6RwmMVds9vW
	+i/eM9CTEYYmF2KAbjcBQ86En0Yv1HOJB9098v/rnD7OcQb+XsIeb3eYm/0AYRXFrmEg
	ire6uDYoMpGcZadmAf7Ul5RFqvEWGxI1nS1v5oeO22BFbY4kJh7TyOb4OsdTb5kEBfpt
	kdtg==
MIME-Version: 1.0
Received: by 10.50.190.167 with SMTP id gr7mr17786984igc.53.1331222776163;
	Thu, 08 Mar 2012 08:06:16 -0800 (PST)
Received: by 10.42.75.137 with HTTP; Thu, 8 Mar 2012 08:06:16 -0800 (PST)
In-Reply-To: <1331025741-26216-3-git-send-email-koen@dominion.thruhere.net>
References: <1331025741-26216-1-git-send-email-koen@dominion.thruhere.net>
	<1331025741-26216-3-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 8 Mar 2012 17:06:16 +0100
Message-ID: <CALbNGRS0G-b+HosquMCNFV5J4R+tN+GmrDDg_r2ja=YYwpX7vQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 3/3] systemd: update to latest git
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
X-List-Received-Date: Thu, 08 Mar 2012 16:14:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 10:22 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> This is in preparation for the v44 release.
>
> * drop 2 patches that aren't needed anymore
> * fix more endianness problems
> * fix journal crashes with large files
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Andreas M=FCller <schnitzeltony@googlemail.com>


