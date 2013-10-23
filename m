Return-Path: <msteveharrison@gmail.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5B56D2F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 23:29:31 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id 10so851511vbe.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2013 16:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=mXCKvshhYhGidbOIxIriyNWFjy+zYvCPjk5/HmIE9bA=;
	b=Rh7kgvesnKgPcRJs2sXFbjOUlH/bysdVkwBysSYyZT85zgkAIyYFHKY9d+nJ/JrSLr
	T75Lyeq6GudDAIaWkZj0rKTRB9MTrh6k71eW9N0Jm8+d95lyMgder3gnnR8tbRbcBm1m
	yv9CDrwMOOhhOcNWD6wclcixYxnOK6uEzlC7wnxluXMqhzlTnoussANquOsl4ise96PM
	im3HlcQ+vm0pkbL5Vv8xirVFF7V6XvooQSgNeqApOhGJSKxuTSmu7rKZZLRlS6VaSaeu
	RwTzfwTsOLv8+ECDU6AvYwmzyb4v0YNmTUCWEbawNUkMEw6YiB/8kK13h3fp9K7Nco5u
	Q69g==
MIME-Version: 1.0
X-Received: by 10.221.6.195 with SMTP id ol3mr501520vcb.34.1382570972602; Wed,
	23 Oct 2013 16:29:32 -0700 (PDT)
Received: by 10.220.75.72 with HTTP; Wed, 23 Oct 2013 16:29:32 -0700 (PDT)
In-Reply-To: <52685AB2.2060606@balister.org>
References: <CAGJTLJ6MLtO_neHZq7QoER7Vs4JCLnfXZbxHeKhtV53V2+PDkw@mail.gmail.com>
	<52685AB2.2060606@balister.org>
Date: Wed, 23 Oct 2013 16:29:32 -0700
Message-ID: <CAGJTLJ5z=8Wjj2WOzid3MuaJEErc_Qja93bk5Uponw-aXwcxQA@mail.gmail.com>
From: Stephen Harrison <msteveharrison@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Issues Building Numpy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2013 23:29:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Yes I do have these libraries installed on the build machine. Are you
saying I need to uninstall them?




On Wed, Oct 23, 2013 at 4:24 PM, Philip Balister <philip@balister.org>wrote:

> Do you have atlas, blas etc installed on the build machine. As I recall
> the numpy recipe is weak and tends to finds things installed on the
> build machine.
>
> Philip
>
> On 10/23/2013 08:22 PM, Stephen Harrison wrote:
> > Hi,
> >
> > I am trying to build an image for the Zedboard (ARM) platform. I can't
> seem
> > to build the Numpy package and I can't quite understand why.
> >
> > I've attached the compile log. I've noticed there are many complaints
> about
> > ATLAS, BLAS etc not being available and other errors about executables
> > being in the wrong format.
> >
> > Any help would be much appreciated.
> >
> > Regards,
> >
> > Stephen
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

