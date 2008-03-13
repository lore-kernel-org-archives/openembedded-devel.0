Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JZoWx-0003vF-DA
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 15:36:02 +0100
Received: by wa-out-1112.google.com with SMTP id v27so4117152wah.4
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 07:33:05 -0700 (PDT)
Received: by 10.114.150.1 with SMTP id x1mr9441036wad.46.1205418785300;
	Thu, 13 Mar 2008 07:33:05 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 13 Mar 2008 07:33:05 -0700 (PDT)
Message-ID: <f96d234e0803130733h26fca715gaed7364abd4d7955@mail.gmail.com>
Date: Thu, 13 Mar 2008 10:33:05 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fr8p9u$8s0$1@ger.gmane.org>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<fr8p9u$8s0$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 209.85.146.181
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 14:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Mar 12, 2008 at 10:28 AM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
>  Cliff Brake schreef:
>
>
>  | Mercurial looks very interesting and nice in many aspects, but I have
>  | not used it yet.  It seems to me one of the fundamental differences is
>  | the concept of cheap/easy local branches.  Mercurial is working on
>  | something like that
>  | (http://www.selenic.com/mercurial/wiki/index.cgi/LocalBranches), but
>  | it is obviously not central to its philosophy like git .  The idea of
>  | creating many local branches a normal port of your development
>  | workflow seems unique to git.  As the gitmagic link below states, it
>  | makes it very easy to switch context to fix a bug, and then resume
>  | work on another feature.  This is a lot more than just "being good at
>  | generating patches"; it is a change in the way we work.
>
>  I can see how that's a good thing for what I call "traditional
>  application development" where a bunch of source files get compiled into
>  a single application (kernel, u-boot, xserver etc) where working on
>  multiple things at once doesn't work, since it makes building and
>  testing a nightmare. Easy branching solves that.
>
>  But OE isn't like that, it's a collection of build descriptions, which
>  makes it possible to be working on a 1000 different recipes at the same
>  time. This also is one of the reasons why mtn is so slow for us: lots of
>  files with a shortlived life spam and =B130 commits per day.

Good point.  BTW, I do appreciate your perspective and contribution to
OE.  At times like this, this appreciation may not be very obvious,
but you have done a great deal to keep the project moving and the
infrastructure running.  Many thanks!

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


