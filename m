Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OjvNB-0005Sc-3q
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 16:36:41 +0200
Received: by eyx24 with SMTP id 24so1310197eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Aug 2010 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=oBJkurJQAvP7l7LM8DS0Jq64zEAR4xZ+gqX7N1jWIrs=;
	b=uLq/4boXH4jOwcgAiBF4eVME/MTI1tUUc+5BryLWFg3P/JwgB9Xbs8hx6Q1+6dB7mV
	E3i+/7im1dQuLuR8hWk5AxZJOIvf6WmoQoG3HMewO3LwvzPVllGM/W9bhXCVr8XRpZ1F
	13IaZSeCdUw6hUvEMFKhDaRopJbLkgCWkPuHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=dD76p04Zo6vVF6Ktv/d1v8fx1d7uMMM3EAeqIhuvuuoh6FlbABKikJZN/9radw7W7a
	aLNlE6SNV18KmTL1D0CT/8CZVYY88b+aSga3Qb7w6NjAXZ5OKiAfVIlwhhzg3ks590YL
	I9Q1PdtGvDW5yB3AJptQG8ZpN9Y9mB7MYwgb8=
Received: by 10.213.113.12 with SMTP id y12mr1663704ebp.53.1281710184270; Fri,
	13 Aug 2010 07:36:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Fri, 13 Aug 2010 07:36:03 -0700 (PDT)
In-Reply-To: <1281691118.3858.22.camel@mattotaupa>
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
	<1281686825.3858.0.camel@mattotaupa>
	<989A078976CDAD4CB2DC976EEF70E2A504270EAC@eu2-mail.mgc.mentorg.com>
	<1281691118.3858.22.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Aug 2010 07:36:03 -0700
Message-ID: <AANLkTi=hM-AbnVXfzy5XLnPi5_0nSimVBVFTob6qEa_b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 14:36:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 13, 2010 at 2:18 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Freitag, den 13.08.2010, 11:01 +0200 schrieb Ahsan, Noor:
>> Actually both works with me with "g" and without "g".
>
> Sorry, I see.
>
> It looks like this is your first patch. So just remember to always sign
> off with the same address, so the statistics get right.

also get rid of that FILESDIR

>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


