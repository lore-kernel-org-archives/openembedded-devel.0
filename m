Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wckong@gmail.com>) id 1QzOip-0002AX-UW
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Sep 2011 10:03:32 +0200
Received: by iagz35 with SMTP id z35so2880041iag.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Sep 2011 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=GTjls8/7A7z+y/XqHPaRtvFj67oA9JVf2Jj0zvNrDo8=;
	b=q9q4JWRF+qVagxUA0/Z8M+75e8W6gVyue4sYjxU2tj8YqtJgkxjGwto3z1gup5luDQ
	YBfl+/e4TvVozbel9aKg/7pE7AvBmH0L4GMckeUYlqThqhr95zB7SQ0GjwApNLcZpLXH
	lxeAU/sfUjIog+YoHp99yhgq8K0jI69EoooPQ=
Received: by 10.42.137.70 with SMTP id x6mr686876ict.388.1314950314075; Fri,
	02 Sep 2011 00:58:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.9.197 with HTTP; Fri, 2 Sep 2011 00:58:14 -0700 (PDT)
In-Reply-To: <1314949058.3526.17.camel@mattotaupa>
References: <CAJR9bDJehg1CPqTBDyn12nFa048Vb1JwfPF7W96pj6ZfA-aHQQ@mail.gmail.com>
	<1314949058.3526.17.camel@mattotaupa>
From: Wei Kong <wckong@gmail.com>
Date: Fri, 2 Sep 2011 17:58:14 +1000
Message-ID: <CAJR9bDK9z_vSNAON2VMkPebsyWGD6vAcrKkCkcSQvU8bRZt4Ww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package trying to link to /usr/lib/.lib instead of /usr/lib during staging
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
X-List-Received-Date: Fri, 02 Sep 2011 08:03:32 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Apologies, but I am not sure how to proceed as I am new to posting on
mailing lists. I don't really want to commit this change, I was just seeing
if anyone knows how to make openembedded look into the correct staging
library folder, and the recipe was there just for reference.

But if I need to submit a patch to get some insight, please let me know.

Thanks

Wei

On Fri, Sep 2, 2011 at 5:37 PM, Paul Menzel <
paulepanter@users.sourceforge.net> wrote:

> Dear Wei,
>
>
> Am Freitag, den 02.09.2011, 17:17 +1000 schrieb Wei Kong:
>
> > During compilation, for some reason, the linker attempts to look for
> > libraries in the wrong directory.
>
> [=85]
>
> please send your recipe without having Google Mail line wrap things, so
> people can test it themselves.
>
> Use `git commit =85` and `git format-patch =85` (and `git send-email`). T=
his
> is also documented in our Wiki (for example [1] and other pages).
>
>
> Thanks,
>
> Paul
>
>
> [1]
> http://openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

