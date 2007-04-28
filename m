Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <xjqian@gmail.com>) id 1Hhf2w-0006Zg-7T
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Apr 2007 07:00:34 +0200
Received: by py-out-1112.google.com with SMTP id n39so913113pyh
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2007 21:51:32 -0700 (PDT)
Received: by 10.65.183.7 with SMTP id k7mr7833644qbp.1177735892642;
	Fri, 27 Apr 2007 21:51:32 -0700 (PDT)
Received: from ?192.168.10.106? ( [71.85.151.212])
	by mx.google.com with ESMTP id 12sm6907157nzn.2007.04.27.21.51.31;
	Fri, 27 Apr 2007 21:51:31 -0700 (PDT)
Message-ID: <4632D294.7030305@gmail.com>
Date: Fri, 27 Apr 2007 23:50:28 -0500
From: Junqian Gordon Xu <xjqian@gmail.com>
User-Agent: Icedove 1.5.0.10 (X11/20070329)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
References: <462B14AF.50903@gmail.com>
	<462B3637.7080604@laposte.net>	<462B4FB2.5090107@laposte.net>	<1177248616.5830.13.camel@localhost.localdomain>	<c384c5ea0704221239h604dbbaai51833eb1af195a5@mail.gmail.com>	<462D7361.9030205@gmail.com>
	<c384c5ea0704250719l791f36cep3f80660d6a74f42@mail.gmail.com>
In-Reply-To: <c384c5ea0704250719l791f36cep3f80660d6a74f42@mail.gmail.com>
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
X-List-Received-Date: Sat, 28 Apr 2007 05:00:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Leon Woestenberg wrote:
> Like Holger said, it should work without pax-utils installed on your
> host, as OE should pick up and build a native version for you.
>
> I'm going to try that.
>
> Regards,
>
> Leon.

Ok, it works fine for me without pax-utils on host.

Seems the dev team is starting a bug squashing party. I don't have time 
to read up all the emails now. But once I got through that, I will 
probably close the bug or mark it dependent on the insane.bb bug.

Gordon


