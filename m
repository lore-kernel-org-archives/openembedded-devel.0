Received: from [209.85.146.177] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1IfMk7-00021d-90
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 23:35:55 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2417664waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2007 14:30:02 -0700 (PDT)
Received: by 10.114.14.1 with SMTP id 1mr4313544wan.1191965402382;
	Tue, 09 Oct 2007 14:30:02 -0700 (PDT)
Received: by 10.115.92.17 with HTTP; Tue, 9 Oct 2007 14:30:02 -0700 (PDT)
Message-ID: <432beae0710091430m1628093bm9681988599ef2a14@mail.gmail.com>
Date: Tue, 9 Oct 2007 14:30:02 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <470B9DFE.2010905@linux.it>
MIME-Version: 1.0
References: <470B9DFE.2010905@linux.it>
Subject: Re: preferred version 2.5 of glibc not available
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
X-List-Received-Date: Tue, 09 Oct 2007 21:35:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/9/07, Filippo Basso <phy@linux.it> wrote:
> Hi everybody,
>     another OE question that can keep me awake all night...
>
> When bitbaking an image (angstrom or other, as in
> http://www.openembedded.org/user-manual&dpage=usage_tasks), there is a
> warning about "preferred version 2.5 of glibc not available", while
> glibc 2.5 is there...
> suggestions.............???
>
>
>     NOTE: Resolving missing task queue dependencies
>     NOTE: preferred version 2.5 of glibc not available (for item
> virtual/i586-angstrom-linux-libc-for-gcc)
>     NOTE: Preparing runqueue
>     NOTE: Executing runqueue
>

It's "normal" to see this (I see it too) but I don't know why it
displays either.

-- 
Justin Patrin


