Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S0IG9-0004ym-RV
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Feb 2012 20:53:53 +0100
Received: by lahc1 with SMTP id c1so503934lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2012 11:45:33 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.147.1 as permitted sender) client-ip=10.152.147.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.147.1 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr24216812lab.22.1329939933417
	(num_hops = 1); Wed, 22 Feb 2012 11:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=VY9XxjHX4abjJea8VYNyHUFWVxFlnT9GecqjJBMaWs4=;
	b=BUI8MvzVhXTRWP74BHtu9P/wmH6pEA7FCRm8OfyaMZJj6NurFNl6FIK1rYXpTpg2H3
	uQjW1eZ+CQDpptds/c6micHLDxokMOzv74L0z9F6L09Ekhu4WO/1ta9QpOVeOZ+usZA+
	NCLpr//X7LINOCPBbRpSozNGnG1Tcy8S3Oh1o=
Received: by 10.152.147.1 with SMTP id tg1mr20238614lab.22.1329939933314; Wed,
	22 Feb 2012 11:45:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Wed, 22 Feb 2012 11:45:03 -0800 (PST)
In-Reply-To: <4F452A74.6040603@palm.com>
References: <4F452A74.6040603@palm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2012 11:45:03 -0800
Message-ID: <CAMKF1so5WuUpPzsnzSE-asHkBtMxT61OWW7psxXWMJERPtKwWg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Still no luck with runqemu
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
X-List-Received-Date: Wed, 22 Feb 2012 19:53:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 9:48 AM, Rich Pixley <rich.pixley@palm.com> wrote:
> It boots, and opens a window, but when I type in the window, the keys are
> scrambled.
>
> Screen shot attached. =C2=A0The characters you see are the result of typi=
ng
> "root<return>" into that window.
>
> Does this look familiar to anyone? =C2=A0Who can tell me what I need to d=
o to be
> able to use the qemu?

seems you are using mac as client, I have similar issues on mac. I
never bothered to dive deep
since it worked well from a linux box.

>
> --rich
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


