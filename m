Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PinGz-0001qs-Ir
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 13:17:53 +0100
Received: by qwi2 with SMTP id 2so3151580qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 04:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=7kKBoaFuzPWFMz6fj6g8RJQMwv0tfnP8xKEyBUzEMcI=;
	b=ig4gudaf09z77sdwhgujAExMFAwav/IrfwcosGIUgYISP2YJu1C3EjltoMmjzgQ7Nf
	YSO5rbMpGpUHCUithWAGrTe9Ziw4jILYUqQSaL+O/5YtR9iK2QvhZOYLffnDoOBJPEsB
	NuPerjHvGhR4iS9KrjzAzl1XRXNs+8VMbERfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cFo3Kt/mfy0iD3eY8qI6zKs2WqIGkkq7q1HkNaVtjymLTBwP6Qs1h3QI4gwQkn9yfP
	iYG4EWe+fET0ORlEaVwfiEQ4E645UH5hApJkvLlAfKPg9xwOqb2XyG5aUADbpN2/N8i5
	BeNcrP38JctHidOOICeCzsb5Obx2N27lqI3kg=
MIME-Version: 1.0
Received: by 10.229.217.79 with SMTP id hl15mr2560287qcb.111.1296217016354;
	Fri, 28 Jan 2011 04:16:56 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Fri, 28 Jan 2011 04:16:56 -0800 (PST)
In-Reply-To: <20110128115237.GL2466@ibawizard.net>
References: <1296206349-12470-1-git-send-email-sujak.marek@gmail.com>
	<20110128115237.GL2466@ibawizard.net>
Date: Fri, 28 Jan 2011 13:16:56 +0100
Message-ID: <AANLkTimDKnHd87oRMPpYMFm8YD5h8f8FpsFhXVBmYot1@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] linux: vmx25 module (i.mx25) kernel patches * defconfig - default kernel config for vmx25 * linux-patch - add partial support for vmx25 baseboard pheripherals Signed-off-by: sujak.marek <sujak.marek@gmail.com>
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
X-List-Received-Date: Fri, 28 Jan 2011 12:17:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you, I think that now is much more clear to me how to send it. I will
try to re-commit this patch.

Best regards,
masu

On Fri, Jan 28, 2011 at 12:52 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:

> Hi,
>
> it looks like, that most of your patches got malformed somewhere in the
> transit or you've forget to add newline after the first line in your git
> commit message, so the description of the commit is now part of the
> subject[1].
>
> 1. http://comments.gmane.org/gmane.comp.handhelds.openembedded/41958
>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

