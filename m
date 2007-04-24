Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <xjqian@gmail.com>) id 1HgE3K-00045L-4F
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2007 07:59:02 +0200
Received: by py-out-1112.google.com with SMTP id n39so1405438pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Apr 2007 22:59:01 -0700 (PDT)
Received: by 10.65.240.17 with SMTP id s17mr13272798qbr.1177383831021;
	Mon, 23 Apr 2007 20:03:51 -0700 (PDT)
Received: from ?192.168.10.106? ( [24.107.178.232])
	by mx.google.com with ESMTP id 5sm888498nzk.2007.04.23.20.03.48;
	Mon, 23 Apr 2007 20:03:49 -0700 (PDT)
Message-ID: <462D7361.9030205@gmail.com>
Date: Mon, 23 Apr 2007 22:02:57 -0500
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
X-List-Received-Date: Tue, 24 Apr 2007 05:59:02 -0000
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
>
>   
Works for me after updating the bitbake to revision 816 and installing 
pax-utils.

Should I close the bug or does anyone has anything to add?


