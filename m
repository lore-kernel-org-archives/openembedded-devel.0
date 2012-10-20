Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXfx-0008OR-Od
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 13:57:10 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so837171pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Ex8lPhBQR8k6jfpa7dpx5OBxWlgbwOISnT1/dsTKhT0=;
	b=FlW1bZAjTBd9Y1w/r/ZCG/bVf45xtSR+QEw0p+w6u1wdJ+Lxw0OreoASzdgX6zkZ4R
	xyaEBDwCTd4wvPOxaQOSBSrwMyuaiVk7NLX1yA8T4eKwmLPOz2bl7jN0XNPaKEDoWlku
	m9fA2puJa25FuMiC3RaGl+9ncxV6eDxJ3o6tR6/TzxPeRK7EJjVsSVc95QovkcHLcjgK
	v5n0TcNk0KH8vHtjMw2rE7gMYlRkCZdIV/ksipOf3LMp8KK7tXGnv+S1c/1MiZ5kqqbe
	AChS/Z1WC9d2s94f6oZewaq1YBMHpahgkVG3D9errWpzN/CR75M0r8J0xo4fOe8bbn/R
	4qsw==
MIME-Version: 1.0
Received: by 10.66.87.133 with SMTP id ay5mr11867378pab.59.1350733427085; Sat,
	20 Oct 2012 04:43:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:43:47 -0700 (PDT)
In-Reply-To: <1350679091-5909-3-git-send-email-morgan.little@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
	<1350679091-5909-3-git-send-email-morgan.little@windriver.com>
Date: Sat, 20 Oct 2012 08:43:47 -0300
X-Google-Sender-Auth: UJa_dsZjFml-8Z5NuXPkk3vRytk
Message-ID: <CAP9ODKpiTyivS3ap-WP0qUtzuFiGZ2hHOZ41Y82tqUe9Qv4oxw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-networking][PATCH 2/3] ntp: Uprev from 4.2.6p3 to 4.2.6p5
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
X-List-Received-Date: Sat, 20 Oct 2012 11:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 5:38 PM, Morgan Little
<morgan.little@windriver.com> wrote:
> Signed-off-by: Morgan Little <morgan.little@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


