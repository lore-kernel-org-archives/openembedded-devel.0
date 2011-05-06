Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anilm@mistralsolutions.com>) id 1QIHVZ-0007Sy-GA
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 11:39:37 +0200
Received: by iwn10 with SMTP id 10so2810645iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 02:36:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.71.77 with SMTP id i13mr2191779icj.168.1304674616037; Fri,
	06 May 2011 02:36:56 -0700 (PDT)
Received: by 10.231.11.138 with HTTP; Fri, 6 May 2011 02:36:55 -0700 (PDT)
In-Reply-To: <000a01cc0bc4$3277cf70$97676e50$@com>
References: <000a01cc0bc4$3277cf70$97676e50$@com>
Date: Fri, 6 May 2011 15:06:55 +0530
Message-ID: <BANLkTikFEsUA5bVaW5wxVn+85UxqWyknZw@mail.gmail.com>
From: Anil Kumar Mamidala <anilm@mistralsolutions.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: koen@dominion.thruhere.net, Srinath R <srinath@mistralsolutions.com>,
	paulepanter@users.sourceforge.net, nagendra@mistralsolutions.com
Subject: Re: [PATCH] u-boot_git: Ethernet MACID display fix for CraneBoard
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
X-List-Received-Date: Fri, 06 May 2011 09:39:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Thanks for your quick feedback. I am sorry. From my next submissions i will
keep your comments in mind.

Here is my Signed-off .
Signed-off-by: Anil Kumar <anilm@mistralsolutions.com>

This patch was not send to upstream.





> Dear Anil,
>
>
> thank you for the next version.
>
> Am Freitag, den 06.05.2011, 12:45 +0530 schrieb Anil Kumar:
> > CraneBoard u-boot displays the MAC ID wrongly if MAC ID has
> >       preceding zeros. This patch fixes it and updates Ethernet
> >       NRST GPIO from 34 to 65.
>
> Unfortunately you forgot to add your Signed-off-by line. You do not need =
to
> resend the patch, but just reply to this message with the line.
>
> One question though you did not answer.
>
> 1. Did you send this patch upstream?
>
> Some more remarks for the future.
>
> 2. Please mark patch iteration with version information. This patch shoul=
d
> have had =BB[PATCH v2]=AB in the subject.
> 3. The commit message does not have to be indented.
> 4. Please add below the =BB---=AB a short information what changed in the=
 patch
> iteration, like
>
> v2: add commit message
> and finish this by an additional =BB---=AB.
>
> > ---
> >  ...t-MACID-display-fix-for-am3517-craneboard.patch |  108
> ++++++++++++++++++++
> >  recipes/u-boot/u-boot_git.bb                       |    3 +-
> >  2 files changed, 110 insertions(+), 1 deletions(-)  create mode
> > 100644
> > recipes/u-boot/u-boot-git/am3517-crane/0004-Ethernet-MACID-display-fix
> > -for-am3517-craneboard.patch
>
> [=85]
>
> Koen, will you push this or do you want me to do this?
>
>
> Thank you,
>
> Paul
>




--=20
Thanks and Regards
Anil kumar.M

