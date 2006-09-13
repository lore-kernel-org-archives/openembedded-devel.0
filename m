Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GNSvj-0007R1-Ou
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 13:29:23 +0200
Received: by py-out-1112.google.com with SMTP id i75so2852307pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 04:25:52 -0700 (PDT)
Received: by 10.35.102.1 with SMTP id e1mr12763959pym;
	Wed, 13 Sep 2006 04:25:51 -0700 (PDT)
Received: by 10.35.96.8 with HTTP; Wed, 13 Sep 2006 04:25:51 -0700 (PDT)
Message-ID: <74d0deb30609130425qa0394bbl9d5e8374e97793ae@mail.gmail.com>
Date: Wed, 13 Sep 2006 13:25:51 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <4507E64D.3040105@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
	<1158139503.5540.10.camel@localhost.localdomain>
	<74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
	<4507E64D.3040105@dominion.kabel.utwente.nl>
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 11:29:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/13/06, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> pHilipp Zabel schreef:
>
> > btw,
> > http://www.openembedded.org/repo/org.openembedded.dev/packages/udev/files/mount.sh
> > returns a 403
>
> We'd welcome input from apachache/web savvy people on how to get .sh/.py/.php files to
> display as text when accessed from http://www.openembedded.org/repo/ or
> http://www.openembedded.org/filebrowser.

I'm not -savvy, but perhaps this could work:

AddType text/plain sh
AddType text/plain py
AddType text/plain php

in repo/.htaccess

cheers
Philipp


