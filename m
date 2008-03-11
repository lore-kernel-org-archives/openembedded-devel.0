Received: from [209.85.198.190] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bernardo@bandos.net>) id 1JYyw3-0006Yy-CX
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 08:30:12 +0100
Received: by rv-out-0910.google.com with SMTP id c24so2353639rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 00:28:08 -0700 (PDT)
Received: by 10.140.139.3 with SMTP id m3mr3901960rvd.38.1205220487965;
	Tue, 11 Mar 2008 00:28:07 -0700 (PDT)
Received: by 10.141.63.6 with HTTP; Tue, 11 Mar 2008 00:28:04 -0700 (PDT)
Message-ID: <3ef3a7ad0803110028u416f9ad1y2d4929bb4da9aa8f@mail.gmail.com>
Date: Tue, 11 Mar 2008 07:28:04 +0000
From: "=?ISO-8859-1?Q?Jos=E9_Bernardo_Bandos_Rodrigues?=" <bernardo@bandos.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <a7f8874a0803101037p1e156eedx32eddf87c45fb890@mail.gmail.com>
MIME-Version: 1.0
References: <a7f8874a0803101037p1e156eedx32eddf87c45fb890@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.198.190
X-SA-Exim-Mail-From: bernardo@bandos.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: [RFC]: Is MACHINE_TASK_PROVIDER still being used or should it be phased out?
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
X-List-Received-Date: Tue, 11 Mar 2008 07:30:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I do use and build for personal use opie-image frequently. Will this break
it, or the replace should go smoothly?

On 3/10/08, Hans Henry von Tresckow <hvontres@gmail.com> wrote:
>
> (sorry for the repost, but I forgot the RFC tag the first time)
>
> I am trying to fix http://bugs.openembedded.net/show_bug.cgi?id=3969.
>
> I basicaly have two options here:
>
> 1) simply replace MACHINE_TASK_PROVIDER with task-base-extended in the
> affected recipie
>
> 2) come up with a different solution that preserves MACHINE_TASK_PROVIDER
> and adds a suitable definition
>
> It seems that a lot of recent image recipies have used approach #1 and I
> was
> wondering if MACHINE_TASK_PROVIDER  was still actively being used or if it
> is mostly left over from the initial task-base switchover.
>
> Also, if it is still in use, do any of the current users care about
> opie-image in particular?
>
> (I will use #1 if I don't hear back soon)
>
> Thank you very much,
>
>
> --
> Henry von Tresckow (hvontres)
>
> Poodle life support team
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

