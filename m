Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1RJbvv-0004t0-0L; Fri, 28 Oct 2011 04:12:35 +0200
Received: by ggnj1 with SMTP id j1so3217214ggn.6
	for <multiple recipients>; Thu, 27 Oct 2011 19:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0rtlgtbCHlbzW6gVnV8nC4bo4O9H+k0veqeJZjLO3z4=;
	b=vh5anp0iAmhdMzqKdEHDj0DZsX8wymN4j4wMM7ewPonkPzg80T+4qlUyI0xiNHpKWG
	WMlw3hMHjfYwatbBmBUMEynhal/KKB/Aks+BuuwmupFJR0hyiLs3ZsAGxgjlV/j2ukOl
	BjioQ4bmDiduQoyEraM3QSdhOqrg6+WZDZWcw=
MIME-Version: 1.0
Received: by 10.236.124.17 with SMTP id w17mr471511yhh.126.1319767593043; Thu,
	27 Oct 2011 19:06:33 -0700 (PDT)
Received: by 10.236.60.198 with HTTP; Thu, 27 Oct 2011 19:06:32 -0700 (PDT)
In-Reply-To: <20111027210911.GM15391@denix.org>
References: <E1RJWkv-0001RX-LN@happy.bec-systems.com>
	<20111027210911.GM15391@denix.org>
Date: Thu, 27 Oct 2011 22:06:32 -0400
Message-ID: <CAOd_LFw0kBsf-NDpUQ-rUHxYP+v_5Ff3nuSNTUK3QuSrB5_eHw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "angstrom-distro-devel@linuxtogo.org"
	<angstrom-distro-devel@linuxtogo.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE Changelog for 2011-10-17 to 2011-10-24
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
X-List-Received-Date: Fri, 28 Oct 2011 02:12:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thursday, October 27, 2011, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Oct 27, 2011 at 04:40:53PM -0400, cliff.brake@gmail.com wrote:
>> Changelog for 2011-10-17 to 2011-10-24.  Projects included in this
report:
>
> Cliff,
>
> FYI, I think you have a bug in your scripts, where it misses commits made
on
> Monday, that were not included in the previous ChangeLog and they are
being
> skipped in this one...

Can you give me an example of a commit that got missed and I'll debug?

>
> Also, can you please include meta-ti@yoctoproject.org as the official
mailing
> list for meta-ti/meta-texasinstruments BSP layer. Thanks.
>

Ill look into something like that.  We currently don't have any type of
email field, but something could be added.

Thanks,
Cliff


> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
=================
http://bec-systems.com

