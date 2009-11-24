Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1ND0A5-0005T4-2p
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 19:30:52 +0100
Received: by fxm8 with SMTP id 8so7178857fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iO16CAooHqL0kwwgB1Bxju03yIqhn1E2kCdKSCFEWDc=;
	b=BagOvL/QWn8WlfXK7hWQ5mDfMuR2Lk0puJJFfepb/nS6v6uTNSktySfaevJ+SJgI2f
	vOFz/Px6EPUEUINjWs+uPv6JFJOQSVAif/mEVXJ5dd8j2vx0QL4h+FnOe22TVxPWTnF3
	8kwlYkwM+ZGTBkOEzipeALQXzVGVvZZg2Bpp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CAcrZ/64Asahee86UVWfLtGynqr9o/dQkJIR41akgR1YCKPopd/xQj39keSES0Pfkz
	tiPhOREfuTAWadVEbacLxIBQX4D0OPPVnAMSXqCp9+m0utH/uaJ67w8RhSHKkMTCV+8G
	1b7G1aSNP4phNWg1MA7NXTaGi3Sjp2wsdXE5E=
MIME-Version: 1.0
Received: by 10.216.90.74 with SMTP id d52mr2132419wef.51.1259087360121; Tue, 
	24 Nov 2009 10:29:20 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911220630310.30680@localhost>
References: <alpine.LFD.2.00.0911220630310.30680@localhost>
Date: Tue, 24 Nov 2009 13:29:19 -0500
Message-ID: <f96d234e0911241029k70afdb40n4792b3b0ae69377e@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: suggested fixes for docs/usermanual/ directory
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
X-List-Received-Date: Tue, 24 Nov 2009 18:30:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2009 at 6:36 AM, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
>
> =A0enough little fixes that i'll let someone else decide exactly what
> form those fixes will take.
>
> 1) Makefile typo: =A0"sytlesheets" -> "stylesheets"

Done.

> 2) the "clean" target should get rid of generated output files in that
> directory, such as ".ps" and ".pdf" files, and any others that might
> show up.

Patches welcome :-)

> 3) .gitignore should be extended to include all other possible output
> file types, especially "*.ps", which keeps showing up in "git status",
> and other possible output directories.

Done.

Thanks,
Cliff


