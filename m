Received: from [64.233.170.185] (helo=rn-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hvontres@gmail.com>) id 1Io3yz-0001Nt-K0
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2007 22:23:13 +0100
Received: by rn-out-0102.google.com with SMTP id e24so458909rng
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Nov 2007 14:22:48 -0700 (PDT)
Received: by 10.142.126.17 with SMTP id y17mr476537wfc.1194014938736;
	Fri, 02 Nov 2007 07:48:58 -0700 (PDT)
Received: by 10.143.11.12 with HTTP; Fri, 2 Nov 2007 07:48:58 -0700 (PDT)
Message-ID: <a7f8874a0711020748mc1b9a55sf3f97b6b55a1e455@mail.gmail.com>
Date: Fri, 2 Nov 2007 07:48:58 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: "Uli Luckas" <luckas@musoft.de>
In-Reply-To: <200710192235.46408.luckas@musoft.de>
MIME-Version: 1.0
References: <a7f8874a0709212103h126eeea7y751fa5fd4256fb20@mail.gmail.com>
	<200709261801.13349.u.luckas@road.de>
	<a7f8874a0710091402w7af1b580pe1fa89f95f5626de@mail.gmail.com>
	<200710192235.46408.luckas@musoft.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Kexec Cmdline Support
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
X-List-Received-Date: Fri, 02 Nov 2007 21:23:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 10/19/07, Uli Luckas <luckas@musoft.de> wrote:
>
> Am Tuesday, 9. October 2007 schrieb Hans Henry von Tresckow:
> > Ok, I have tested your patch and it works very well. I think the only
> real
> > stumbling block left is figuring out a way to get the base address for
> the
> > ATAG list without hard-coding it. I think if we can somehow access the
> > machine_desc structure in the kernel from user space, this would be
> easy.
> > Unfortunately I am not very good at kernel hacking yet, so if you or
> > someone else on the list has an idea, please let me know.
>
> Hi Henry,
> sorry for letting you wait so long. I am out of office until 10/29. After
> that
> I can provide a kernel patch to export the ATAG list's base address and
> also
> the old ATAG list. For now the patch will be against 2.6.21 though, as I
> don't have a running, more recent kernel available.
>
> Regards
> Uli
>
> --
> Fr=FCher oder sp=E4ter emulieren wir euch
> - Linux.de
>

Uli,
Any luck getting that patch put together? I would really love to start
testing this soon :)

--=20
Henry von Tresckow (hvontres)

