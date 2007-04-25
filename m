Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HgnW0-0003SR-S4
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Apr 2007 21:51:03 +0200
Received: by wx-out-0506.google.com with SMTP id t14so336935wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2007 12:42:14 -0700 (PDT)
Received: by 10.90.29.18 with SMTP id c18mr748312agc.1177510789254;
	Wed, 25 Apr 2007 07:19:49 -0700 (PDT)
Received: by 10.90.65.4 with HTTP; Wed, 25 Apr 2007 07:19:49 -0700 (PDT)
Message-ID: <c384c5ea0704250719l791f36cep3f80660d6a74f42@mail.gmail.com>
Date: Wed, 25 Apr 2007 16:19:49 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <462D7361.9030205@gmail.com>
MIME-Version: 1.0
References: <462B14AF.50903@gmail.com> <462B3637.7080604@laposte.net>
	<462B4FB2.5090107@laposte.net>
	<1177248616.5830.13.camel@localhost.localdomain>
	<c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>
	<462D7361.9030205@gmail.com>
Subject: Re: linux-libc-headers build problem for tosa
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
X-List-Received-Date: Wed, 25 Apr 2007 19:51:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 4/24/07, Junqian Gordon Xu <xjqian@gmail.com> wrote:
> Leon Woestenberg wrote:
> > Same types of issues here with linux-libc-headers.
> >
> > URL: svn://svn.berlios.de/bitbake/branches/bitbake-1.8
> > Revision: 816
> >
> > When I install pax-utils natively (Ubuntu 7.04 x86_64) the insane class works.
> >
Like Holger said, it should work without pax-utils installed on your
host, as OE should pick up and build a native version for you.

I'm going to try that.

Regards,

Leon.


