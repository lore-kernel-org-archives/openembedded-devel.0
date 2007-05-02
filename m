Received: from [64.233.162.227] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1HjL1p-0001Fu-Tl
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2007 22:02:22 +0200
Received: by nz-out-0506.google.com with SMTP id m22so243126nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2007 12:52:55 -0700 (PDT)
Received: by 10.114.111.1 with SMTP id j1mr367872wac.1178135574781;
	Wed, 02 May 2007 12:52:54 -0700 (PDT)
Received: by 10.114.152.15 with HTTP; Wed, 2 May 2007 12:52:54 -0700 (PDT)
Message-ID: <bdb0025f0705021252w7e32b305ybf9c914c1cb1edc0@mail.gmail.com>
Date: Wed, 2 May 2007 16:52:54 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200705022051.03720.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <bdb0025f0705021104x23d2c407rb4da0e48e24eb911@mail.gmail.com>
	<200705022051.03720.openembedded@hrw.one.pl>
Subject: Re: generating debian source packages (dsc)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 May 2007 20:02:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> classes/sourcepkg.bbclass is something which you want to extend

I've thought about it but I'm not sure that it is a good idea because
just few projects (or just mine) needs the dsc file .......... unless
that I code another sourcedsc.bbclass that inherit the
sourcedpkg.bbclass... o you think that it will work???  I'll think
about it...

Another doubt that I forgot to mention on last email is about changelog:
I'm generating a almost empty changelog file. Is there any official
and/or more appropriated way to do that?

Thanks,
Vivi.

>
> --
> JID: hrw-jabber.org
> OpenEmbedded developer/consultant
>
>       I'm trying to decide if I should kill you or simply feign death
>       until you feel awkward and leave.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


