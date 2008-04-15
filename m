Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1JlugA-0001Sh-6l
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Apr 2008 01:35:10 +0200
Received: by wx-out-0506.google.com with SMTP id h27so2082226wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2008 16:35:02 -0700 (PDT)
Received: by 10.114.67.2 with SMTP id p2mr8984581waa.1.1208302500737;
	Tue, 15 Apr 2008 16:35:00 -0700 (PDT)
Received: by 10.115.91.6 with HTTP; Tue, 15 Apr 2008 16:35:00 -0700 (PDT)
Message-ID: <432beae0804151635g1f1e99e0hfe9f333a0a036231@mail.gmail.com>
Date: Tue, 15 Apr 2008 16:35:00 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48053A37.6050605@gmail.com>
MIME-Version: 1.0
References: <20080415034950.982CC189218@amethyst.openembedded.net>
	<48048B4C.5090805@gmx.net> <48053A37.6050605@gmail.com>
Subject: Re: [oe-commits] org.oe.dev libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging
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
X-List-Received-Date: Tue, 15 Apr 2008 23:35:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Apr 15, 2008 at 4:28 PM, Junqian Gordon Xu <xjqian@gmail.com> wrote:
>
> On 04/15/2008 06:02 AM, Robert Schuster wrote:
>  > Hi.
>  >
>  > xjqian commit schrieb:
>  >> libtomcrypt: fix SRC_URI (close oebug 4159), bump to 1.17, fix staging
>  >
>  >> * no idea why the previous maintainer leave do_install empty, but assuming there is a legit reason.
>  > I recently stumbled upon libtomcrypt in another project may provide an
>  > answer to this: libtomcrypt can be customized in many ways and chances
>  > are good that if you just compile and install the library with default
>  > settings those are wrong for the package that wants to use it.
>  >
>  > The library's source is usually directly put into the package that uses
>  > it (see asterisk, OpenTNL) and I am wondering whether it really makes
>  > sense to have it in OE as a package.
>
>  Thanks. so the recipe is just a template for people who wants to use it.
>    I will just leave it there until somebody with strong opinion
>  suggests otherwise.
>

I'm pretty sure that PHP links to it for its mcrypt extension.

-- 
Justin Patrin


