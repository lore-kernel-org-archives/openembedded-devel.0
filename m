Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P24vS-0002CM-Bw
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 18:27:11 +0200
Received: by iwn2 with SMTP id 2so5082260iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hiWIAWjuN7Q9ZaJyvaLOXIGDQ5C/pxsfJlB84fGruec=;
	b=DL9Ss2U1uBbQOKoapcP0EAXmAdoUGcbMhaRMfxIutQ2aHXFH59vV4oa6pxGh5EQA/j
	IVjDfaHG8vZv7jrDIPJagvMxG55ByqLbbt8/C2LzZZM5JvSEhtzI0rKnNBadsg/wYzgY
	0lyCdjEsJ0TBojtGWvE8Io/Vq/8kMknE4lDBY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=mcxI2aegmrh9Wpj3gyhYouxektN7LmORQT+X3xQXDkXcYnzbeYdmz5fUwnmiLhOHas
	W0kdBl+4XcgBK8PGMiXv7QnQM3CY2ZoOP9qTYf/k4v9ZUwrcHtMAaza5Lr0td7kmM0a6
	GX6a4mlaInbU40H+KGJlNGwxP4wT2XS/HaPHQ=
MIME-Version: 1.0
Received: by 10.231.33.205 with SMTP id i13mr7431243ibd.59.1286036801312; Sat,
	02 Oct 2010 09:26:41 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 2 Oct 2010 09:26:41 -0700 (PDT)
In-Reply-To: <4CA5C47F.4030702@opendreambox.org>
References: <1285931854-17148-1-git-send-email-obi@opendreambox.org>
	<1285931854-17148-4-git-send-email-obi@opendreambox.org>
	<4CA5C47F.4030702@opendreambox.org>
Date: Sat, 2 Oct 2010 18:26:41 +0200
Message-ID: <AANLkTi=XnRb+CcuO8DZUBFgd5UeYx+UxaHuOBARyVjOY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] libcdio-0.82: reduce package size, add dependencies, move recipe
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
X-List-Received-Date: Sat, 02 Oct 2010 16:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/1 Andreas Oberritter <obi@opendreambox.org>:
> On 01.10.2010 13:17, Andreas Oberritter wrote:
>> * Depend on libcddb and ncurses.
>
> It should be mentioned that this change depends on the previously
> submitted patch to add a recipe for libcddb [1].
>
> Best regards,
> Andreas
>
> [1] http://patchwork.openembedded.org/patch/3104/
>

Applied.
Next time please bump PR if you change e.g. dependencies.

Frans


