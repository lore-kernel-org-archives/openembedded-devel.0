Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id E5069601A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 22:07:14 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id w8so3329718qac.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 15:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ZcN5dw64QyMeQ4UcXKo3ADh8GvEEDDCsAcU5DYXTOww=;
	b=vd+Njzrog5C1bijz2qhiXAZVN2WoWL4WAamWW/SNAaBptybTBBJwSuigb/z+4a1ruC
	L0/RvYESZLUW09qPaRNqhS0Z47GTCCj7lFNcGEk/KbD+y4UYRkRYJmlh+MpHkI8UMeGc
	Z6/BlxGFSlvfrsKqdiMBV+h4/uK8RVHlQPNeSpPKcroeFY5j9cgp/XIrmqWEfxpWwucf
	jEknyvcSYN4p9hcUYjs0+qF1MBsa5eQKYzOa6te3O71QsqV7p771lkGTdjcaOme4a+tI
	dd/O+EuLG1NrKkS55kr67Azz82G66BlMNxweyP/TAGrbym8cfkIeDYvxhyXC4KqI5a+U
	dnJg==
X-Received: by 10.224.161.129 with SMTP id r1mr18952997qax.86.1403820435316;
	Thu, 26 Jun 2014 15:07:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 26 Jun 2014 15:06:55 -0700 (PDT)
In-Reply-To: <20140626180954.GG1580@denix.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 26 Jun 2014 19:06:55 -0300
Message-ID: <CAMCfZKH82XRE7j2CV0QThWbFBQSC3QBVwDWi0AbBE2T=15WWFw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: State of the art for creating an image that you can dd to an SD card
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jun 2014 22:07:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Denys,

On Thu, Jun 26, 2014 at 3:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> "CHS business", as Philip called it, was only partially required in the
> early
> days of OMAP3 SoCs few years ago, due to some "specific" FAT
> implementation of
> the BootROM. These days it's not required on modern Sitara SoCs.
>

So it could be true for am3517 of 3 years ago.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

