Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RvpGP-0006Ac-N7
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 13:07:41 +0100
Received: by eekd41 with SMTP id d41so770661eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=LWrG6pBT87lV9k4h0cuWhWFyQeOfiOXAIyIYt5d/QqE=;
	b=nBQWKrCpR8STVBEFnKBLH/JWz4ePmtoZtgHEBOrU5g/PhjMOKpvbXRzattBC+P7m+g
	PDvxuczhVIGhiUvT5zV9uPnaV/M9FcLB+3SRko0rzJcOOvMMsN3j7ypR8RA+WDqf7SCn
	ZJqItU/PuYLw8uJUEsnd26FPzNjhBifUmvUYo=
MIME-Version: 1.0
Received: by 10.14.48.65 with SMTP id u41mr1970257eeb.39.1328875175692; Fri,
	10 Feb 2012 03:59:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.14.96.129 with HTTP; Fri, 10 Feb 2012 03:59:35 -0800 (PST)
In-Reply-To: <1328828643.29809.7.camel@mattotaupa>
References: <1328022931.3975.15.camel@mattotaupa>
	<DEE6B7FB-FCB8-47BF-A58B-CDD4C6BDC06D@keylevel.com>
	<1328828643.29809.7.camel@mattotaupa>
Date: Fri, 10 Feb 2012 09:59:35 -0200
X-Google-Sender-Auth: Uh1_IthfNsSdh8INg02pit-mxPs
Message-ID: <CAP9ODKpo4GbQUg_NHf0bp3rBy_bYq_xDMSue-S3+LMk31xg0GQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Board support package (BSP) layers/distributions for Geode LX800
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
X-List-Received-Date: Fri, 10 Feb 2012 12:07:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 21:04, Paul Menzel <paulepanter@users.sourceforge.net
> wrote:

> > This isn't in a suitable state to push back (to Yocto), but I'm happy
> > to share what I've got if it's going to be of any help.
>
> If you could publish your Git tree somewhere that would be great.
>

If you can add it to github or something I might contribute some changes as
I have Geode working internally at O.S. Systems but not as a separated
Layer.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

