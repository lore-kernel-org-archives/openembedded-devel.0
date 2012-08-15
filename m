Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1T1hsv-0004PR-SI
	for openembedded-devel@lists.linuxtogo.org;
	Wed, 15 Aug 2012 20:00:02 +0200
Received: by pbcwy7 with SMTP id wy7so158188pbc.6
	for <openembedded-devel@lists.linuxtogo.org>;
	Wed, 15 Aug 2012 10:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=Bl0rkJnLiz+zmlbp+34phQyPgio9tRBmJla708RycEM=;
	b=PUwrl61EZBNoNaFtb+y0fgNtM5jeGJi66IJesGOcZ61uwoEldFt39dN9bVVJFm0zEs
	XDfsZ53rLnkvpjqVN7Z4FVVMt0qt31tz9xhucyiFX1aFhuqnr6TaE3V5P8U1L0n2Jyxy
	utXzyRncNADCX7rkL+n8eNxbKE+Lim2jUp/YgvQXl4b0s83YcyVbIEuxl3GVSDW8HJSz
	iCoeEuA/oyepH0nJPgYQI+6lsfXEkjyKZZfsRgSbWx7fUUZ98ufwjxV9Qy4R921feZoW
	HezJPixm8TvRB/5T6t7BEH4VkvXVoGxmJbZ7Usk1RFo7998H0slOI+/aGv5K54Y6WmWm
	SY2Q==
MIME-Version: 1.0
Received: by 10.68.213.5 with SMTP id no5mr27732174pbc.24.1345052884685; Wed,
	15 Aug 2012 10:48:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Wed, 15 Aug 2012 10:48:04 -0700 (PDT)
In-Reply-To: <1345031739-8374-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1345031739-8374-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Wed, 15 Aug 2012 14:48:04 -0300
X-Google-Sender-Auth: gAS6bYc9-cywZzB31u-uxkvq8l4
Message-ID: <CAP9ODKpUziM4W+UiK=da9UkO+UMA-wErx3QQCVM-Rbr7zx-XJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@lists.linuxtogo.org
Subject: Re: [meta-oe][PATCH] freerdp-extension-xpunlimited: inherit gitpkgv
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
X-List-Received-Date: Wed, 15 Aug 2012 18:00:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 15, 2012 at 8:55 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> If you refer to GITPKGVTAG you need to inherit gitpkgv or the result is
> a parsing error.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Acked-by: 	Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


