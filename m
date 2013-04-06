Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOTd6-00031Z-M9
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 15:58:07 +0200
Received: by mail-oa0-f41.google.com with SMTP id f4so4832944oah.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2013 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=NExoM/SvaPAUxnvEAqpoe/uFi0acfoCY1r+fhApjw0I=;
	b=LW6dRee8SZGkcKBxnSyQsASc8XwhrMkCGc7d0Yb+CNphRS69I2DpoDTGwV6lTOMJQU
	o3PXtgmN2g/C5SAWDGAXFQmBKAiQvGHZ3EigiRWn/COHom+Oc3Q5IdELwbP+5fykF7jz
	TGCEorIiWLrnC//xYVOqQKCBM87wIEm0kM1vYeA6NBT8tyv0tk0z8p1fM3IZTEbNdVgO
	pBBbyF5eLllAFSeRU15Dp0xfeDotY5mVQMBOCxaCOZQWqpQsePmMHw/JKvgBV299iYgE
	gKIOC7xdK2jXGucluICZEATPuhrNAQn220a2pRq+iaWcB3Mo1c2+5x0fLvnWm0t4TtaS
	xN3Q==
MIME-Version: 1.0
X-Received: by 10.60.103.165 with SMTP id fx5mr11161420oeb.4.1365255648504;
	Sat, 06 Apr 2013 06:40:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 06:40:48 -0700 (PDT)
In-Reply-To: <ff614a718daecdf00571e386efbcff5f85e8a667.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
	<ff614a718daecdf00571e386efbcff5f85e8a667.1365204818.git.paul.eggleton@linux.intel.com>
Date: Sat, 6 Apr 2013 10:40:48 -0300
X-Google-Sender-Auth: r3d0TUOwnVUtVTgP9mqmmmtfpXQ
Message-ID: <CAP9ODKrCaAm5QFNhtwjnV2iyoU-63rc6L8xqWv7PA1h-BG6yTg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/4] libmad: remove
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
X-List-Received-Date: Sat, 06 Apr 2013 13:58:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> This is largely equivalent to the recipe in OE-Core apart from
> LICENSE_FLAGS, insignificant patch differences, and an additional patch
> for avr32 optimisation (and since there appears to be no public layer
> for an avr32 machine, there's not a great deal of point in preserving
> the latter).
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


