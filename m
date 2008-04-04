Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jhsvv-0001Px-UL
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 22:54:48 +0200
Received: by an-out-0708.google.com with SMTP id b33so52270ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2008 13:54:36 -0700 (PDT)
Received: by 10.100.5.16 with SMTP id 16mr3908065ane.102.1207342476669;
	Fri, 04 Apr 2008 13:54:36 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Fri, 4 Apr 2008 13:54:36 -0700 (PDT)
Message-ID: <c384c5ea0804041354m576977a8he7b3a20acb99a3f5@mail.gmail.com>
Date: Fri, 4 Apr 2008 22:54:36 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200804041346.08584.geoffrey@pager.net>
MIME-Version: 1.0
References: <200804041057.55738.geoffrey@pager.net>
	<47F66A0B.1000904@gmail.com> <200804041346.08584.geoffrey@pager.net>
Subject: Re: Building multiple gdb-cross targets
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
X-List-Received-Date: Fri, 04 Apr 2008 20:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 4/4/08, Geoffrey Wossum <geoffrey@pager.net> wrote:
> On Friday 04 April 2008 12:48:59 pm Khem Raj wrote:
> > Why would avr-linux gdb not work ?
>
Probably because we set the target tripplet only once, and it's
*linux*. (Am I correct?)

> From the avr32linux wiki entry on kernel debugging:
> avr32-gdb (the standalone debugger) or avr32-linux-gdb. Preferably the former
> since it has the ability to read and write system registers.
>
Why would the linux-gdb not be able to touch those registers?

Regards,
-- 
Leon


