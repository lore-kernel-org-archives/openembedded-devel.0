Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SInUm-0005TZ-Jp
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 22:53:28 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SImeS-00039p-3e for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 15:59:24 -0400
Date: Fri, 13 Apr 2012 15:59:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAMKF1spP6QpS5NV2ViL3AduwTU3-WdCFi59K-cX3t9EOLgP8-g@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1204131557110.3985@oneiric>
References: <4F875256.1010100@zoho.com>
	<CAMKF1spP6QpS5NV2ViL3AduwTU3-WdCFi59K-cX3t9EOLgP8-g@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: Apply patches on embedded linux board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 20:53:28 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-259852184-1334347164=:3985"

--8323329-259852184-1334347164=:3985
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 13 Apr 2012, Khem Raj wrote:

> On Thu, Apr 12, 2012 at 3:08 PM, Kevin Qiu <k_q_11@zoho.com> wrote:
> > =C2=A0I am a newbie on Linux. I need to apply the following patch to fi=
x the user
> > button http://patches.openembedded.org/patch/7091/. However, I am not s=
ure
> > if I do need the kernel source to apply the patch. I am just using the
> > Angstrom distro coming with the board.
>
> OK. This will need some learning. You need to learn how to compile a
> Linux kernel. google will show up many documents that should help
> you learn that.

  at the risk of self-promotion, i have the (free) beginning of a
kernel programming course for newbies here:

http://crashcourse.ca/introduction-linux-kernel-programming-2nd-edition/int=
roduction-linux-kernel-programming-2nd-edition

it covers the basics of getting, configuring and building your first
kernel.  everything that's there right this minute is public content,
so help yourself if you find it useful.

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-259852184-1334347164=:3985--
