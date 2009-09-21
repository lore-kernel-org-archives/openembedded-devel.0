Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1MpmJD-0000xT-B5
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Sep 2009 19:04:18 +0200
Received: by ewy20 with SMTP id 20so431810ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Sep 2009 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=ohTYza6d/9A2Zl1ZPg8Kq2dA4JtCPUKKE3xZ/KaYz2M=;
	b=E3U6cyGbSWNnih9+9TRKktSsmihNZTZhlEvO374/Km8/HvrB7D7tH3ZbU4CUtN+FSj
	725ANRNrMtKyau9BCdsP1cFmS+nNEg9KZLj6RIpvj9pYtXqrK4zC9+tqdUxrJfscI556
	lb5VDRWveCSRsP4KDz66LDCqFEN7zx575Zm3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=UsxAFWGkTDehF97PJt3PtRgiZ9/M2ahSR8KAuFgVBmdqsekzsTgHaxz4igGdr8xoLa
	O3mR8iEmJKA8bh/n5MGmV0loxLgDEhmFW2N2e8q+YkBimp2FWHFTETrZZsgw7lsyElTT
	envk1gPNZUWxSZH0ZRzdMGiCGleUHyBgK7+5o=
MIME-Version: 1.0
Received: by 10.216.72.208 with SMTP id t58mr1404690wed.173.1253552618613; 
	Mon, 21 Sep 2009 10:03:38 -0700 (PDT)
In-Reply-To: <359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
References: <200908021211.14793.mok@mnet-online.de> <4A756F8F.30405@gmx.de>
	<200908021304.43335.mok@mnet-online.de>
	<359c5480908040048t54ac4adbsa6a4e4fa88b7557f@mail.gmail.com>
Date: Mon, 21 Sep 2009 19:03:38 +0200
Message-ID: <359c5480909211003p49f636e9p38889c4967b2acc4@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: shr-devel@lists.shr-project.org
Subject: Re: some RRECOMMENDed packages do not get included into the image
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
X-List-Received-Date: Mon, 21 Sep 2009 17:04:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 4, 2009 at 9:48 AM, Nicola Mfb<nicola.mfb@gmail.com> wrote:
[...]
> Some news about that?
> I just reverted bb thread numbers to 1, now kernel is installed and
> rcS too, so I'm experiencing the same of you, no X startup, etc.. I
> tryed 1.8, 1.8-parser-rework and old bitbake from svn, same result.

Hi Klaus,
I just tryed again in the latest days and got the same result.
Was it fixed? is there a workaround? building from milestone5.5 branch is ok.

Best Regards

     Nicola


