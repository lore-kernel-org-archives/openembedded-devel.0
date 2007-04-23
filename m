Received: from [64.233.162.224] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <xjqian@gmail.com>) id 1Hfstg-0004Ro-Uy
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Apr 2007 09:23:43 +0200
Received: by nz-out-0506.google.com with SMTP id f1so1127477nzc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 00:23:40 -0700 (PDT)
Received: by 10.65.152.17 with SMTP id e17mr2918145qbo.1177309225502;
	Sun, 22 Apr 2007 23:20:25 -0700 (PDT)
Received: from ?192.168.10.106? ( [24.107.178.232])
	by mx.google.com with ESMTP id 39sm29292684nzk.2007.04.22.23.20.20;
	Sun, 22 Apr 2007 23:20:21 -0700 (PDT)
Message-ID: <462C4FF3.7020305@gmail.com>
Date: Mon, 23 Apr 2007 01:19:31 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <462B14AF.50903@gmail.com>
	<462B3637.7080604@laposte.net>	<462B4FB2.5090107@laposte.net>	<1177248616.5830.13.camel@localhost.localdomain>
	<c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>
In-Reply-To: <c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>
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
X-List-Received-Date: Mon, 23 Apr 2007 07:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Same types of issues here with linux-libc-headers.
>
> URL: svn://svn.berlios.de/bitbake/branches/bitbake-1.8
> Revision: 816
>
> When I install pax-utils natively (Ubuntu 7.04 x86_64) the insane class works.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I installed pax_utils natively (Debian testing).  But it's still not 
working.

My bitbake-1.8 may be a bit old at revision: 802. I can not update to 
the latest version due to the berlios.de server problem.

I will give it another try when svn update works.

Thanks
Gordon




