Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PkWum-0002u3-24
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 08:14:08 +0100
Received: by qyk8 with SMTP id 8so5095307qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 23:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=UaE1T9X5ucbBmKqikBYG2r+lHP7NFVbHlG6YoaJJnU4=;
	b=LdwAQ/skkhFl6hOsXJPBahpsPZiH4HiPrCjbyRZshtDAH8LSFy/Lph/ZHFVyehWVAE
	5/ocGQZASlutm3qpy2WfqnaVB35HdlWqfRS5nGY0TOyKixHj2PT/OHAJX2Uy+tTlGGrd
	jE5rP7+cicW2EzySwVTghGR34OkWJKfJ1FPRU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jv7wU2fRLJ3f6f/sSoKqW+7Vyac5t4dCY8LGMIf1lCB0m0sFk4Usrx4Ub1ca3iTwSi
	2F6b4CCbphE5tw2SQwmgCrWS+NizTSPLjV9FHzCs0zaMBfeBnEPJHLs55tyNCb4ifeHX
	UivQL/2QKnTVpAz0GOomkP9RldYCLXS10eBMo=
MIME-Version: 1.0
Received: by 10.229.216.193 with SMTP id hj1mr7572289qcb.35.1296630613301;
	Tue, 01 Feb 2011 23:10:13 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Tue, 1 Feb 2011 23:10:13 -0800 (PST)
In-Reply-To: <4D4828F2.6080406@eukrea.com>
References: <1296550862-29994-1-git-send-email-sujak.marek@gmail.com>
	<4D4828F2.6080406@eukrea.com>
Date: Wed, 2 Feb 2011 08:10:13 +0100
Message-ID: <AANLkTi=uwxYBUNZKdVx95KMoKuAWJqZyb2QdZKUuzdqu@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v5] barebox: add patch for vmx25
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
X-List-Received-Date: Wed, 02 Feb 2011 07:14:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Eric

Btw, I don't know why but this patch (and some of the previous ones) didn't
> appear into patchwork which makes sorting and applying them more
> complicated.
>
> I have no idea either (probably i have committed them incorrectly). Next
time i will try to check it more precisely (and i will also improve naming
policy which wasn't the cleanest also).

Thanks!

Best regards,
Marek

