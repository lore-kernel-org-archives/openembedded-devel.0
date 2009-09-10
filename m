Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Mlg1H-0006YT-9z
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 11:32:52 +0200
Received: by fg-out-1718.google.com with SMTP id e21so1373984fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 02:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=31Q89JnVElCrCPSxZddpXLFbyKTt4UNhxIYma8FD/eM=;
	b=BZw/yMx66Y0xwelVFVamz9Sy6AuubixBc1TxSuLNT1czptO5WIImPMaY8mHQoYp7Uh
	7ESdN0OmpdvBgqb+qVpWE0enfzdFR9htYsROVh7j5TfDVOyiP40XUGvbYcCPUg2rmdWo
	hbMfcfJykQUkAVwEbaS2qYpjmoA/2G3p3sunM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OaVAtGP+/gDLuGtUjd4mHsaQlMjv/UmCPDgvq0GEJzgxC/bbZapDilr6OHDcs/n6s3
	PP5A5BzzkKBugtam9Vfuw0wIoJjWQ7cZO9aPMIM9CqnmTuacJhb+atvsu87CJxGn/6WH
	AdCMxOh2GXiN6KOIQNYsTRhHf/5CGIctRjSMs=
MIME-Version: 1.0
Received: by 10.239.168.144 with SMTP id k16mr133767hbe.103.1252575142049; 
	Thu, 10 Sep 2009 02:32:22 -0700 (PDT)
In-Reply-To: <1252350704-9530-2-git-send-email-raj.khem@gmail.com>
References: <1252350704-9530-1-git-send-email-raj.khem@gmail.com>
	<1252350704-9530-2-git-send-email-raj.khem@gmail.com>
Date: Thu, 10 Sep 2009 11:32:22 +0200
Message-ID: <c384c5ea0909100232t5a61bbd4vc72f8db37f83e18e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.155
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] tune-xscale.inc: Use TARGET_ARCH to find endianness
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
X-List-Received-Date: Thu, 10 Sep 2009 09:32:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2009 at 9:11 PM, Khem Raj<raj.khem@gmail.com> wrote:
> * Use TARGET_ARCH to find endianness instead of
> =A0SITEINFO_ENDIANNESS which is not yet evaluated.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
Acked-by: Leon Woestenberg <leon@sidebranch.com>
--=20
Leon


