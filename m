Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1In3Pr-0006BF-Hg
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Oct 2007 03:34:47 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3087991waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2007 19:34:38 -0700 (PDT)
Received: by 10.114.179.1 with SMTP id b1mr483704waf.1193794269495;
	Tue, 30 Oct 2007 18:31:09 -0700 (PDT)
Received: by 10.114.204.10 with HTTP; Tue, 30 Oct 2007 18:31:09 -0700 (PDT)
Message-ID: <bdb0025f0710301831k63953094j71fa9b909dcc43a0@mail.gmail.com>
Date: Tue, 30 Oct 2007 22:31:09 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4727B2EC.1000309@gmx.net>
MIME-Version: 1.0
References: <4727B2EC.1000309@gmx.net>
Subject: Re: enforce armel for packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2007 02:34:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I believe that you can try this:

DPKG_ARCH = "armel"

Regards

On 10/30/07, Robert Schuster <theBohemian@gmx.net> wrote:
> Hi,
> on Debian-based distros ARM EABI is specified as architecture 'armel'.
>
> How can I instruct OE to produce packages that emit 'armel' as their
> architecture?
>
> Regards
> Robert
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>


-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


