Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1QZl8I-0005JG-VO
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:43:51 +0200
Received: by iym10 with SMTP id 10so1729507iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2011 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=OcCanK5s+8sV0AON/wdyNdtJ5y9CbnsVz7tD2Sc1trY=;
	b=CTfMiombHcFsYvTcAXbAg77LNamkdW0A73eu0Y/huGKxoNApf7Twq61RP2QA4gUzTJ
	ZroJLPpPe0Q6MpHigZkz8MSaV56uOKZcdX0IT6bBwMxAYkN2/uCbtFuTeSK3n3llpWea
	16VtPshpuzG3x+6Ilq1q2CdWbXuWi0G4oEZW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GOCcSsMRX7IGu17Yc0VlAwML/tudp3GWXq76VLkL+412Eb8v/chIaW19jSGrjIIS0H
	+ky1QRhGr8BUEAc1ljx1qMFJIiEEuBOV+169t/TlYgQyvOoRuW0rCktd61e95d/Ll7rt
	cdSTAdWGEh4d4vUwMa35ep6Sy6vhWDez55Jk0=
MIME-Version: 1.0
Received: by 10.231.64.148 with SMTP id e20mr1826912ibi.91.1308840014820; Thu,
	23 Jun 2011 07:40:14 -0700 (PDT)
Received: by 10.231.40.11 with HTTP; Thu, 23 Jun 2011 07:40:14 -0700 (PDT)
In-Reply-To: <ittkfr$n5n$1@dough.gmane.org>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
	<ittkfr$n5n$1@dough.gmane.org>
Date: Thu, 23 Jun 2011 09:40:14 -0500
Message-ID: <BANLkTik+3Oa+CWr8YUnDsvOGfdPJiBDoCg@mail.gmail.com>
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Thu, 23 Jun 2011 14:43:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Denys, Koen,

I will submit a v2 patch which removes the "sed" and changes the commit
comment to "OE MACHINE".

On Wed, Jun 22, 2011 at 3:48 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-06-11 21:02, Jeff Lance wrote:
> > * Modify to use arago MACHINE name for platforms
>
> This seems to use OE machine names, not arago ones.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFOAlU7MkyGM64RGpERArNMAKCKDhoL6RlXDoer6iTxSqSSS/kz5gCgl7a/
> QWX5DbueV0sa410g3jcZ/HU=
> =a3L3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

