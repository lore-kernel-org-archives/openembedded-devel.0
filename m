Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <iwamatsu@nigauri.org>) id 1OwOJT-0000DQ-Hr
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 01:56:25 +0200
Received: by pwj1 with SMTP id 1so591604pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 16:55:31 -0700 (PDT)
Received: by 10.142.9.22 with SMTP id 22mr3500567wfi.170.1284681331224; Thu,
	16 Sep 2010 16:55:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.188.10 with HTTP; Thu, 16 Sep 2010 16:55:11 -0700 (PDT)
In-Reply-To: <1284653580.3747.13.camel@mattotaupa>
References: <1284615893-18010-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
	<1284623776.3825.5.camel@mattotaupa>
	<AANLkTi=m8Sg5JtcczZaohgrgmN+y5EbQRYzn6eYoPUVj@mail.gmail.com>
	<1284653580.3747.13.camel@mattotaupa>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Fri, 17 Sep 2010 08:55:11 +0900
Message-ID: <AANLkTikWYQZrymZTb3_OhqXt2NJKqC2Je153JTxcQYb-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: iwamatsu@nigauri.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] eglibc: Update recipe for all version
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
X-List-Received-Date: Thu, 16 Sep 2010 23:56:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, Paul.

2010/9/17 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Donnerstag, den 16.09.2010, 07:31 -0700 schrieb Khem Raj:
>> On Thu, Sep 16, 2010 at 12:56 AM, Paul Menzel
>> <paulepanter@users.sourceforge.net> wrote:
>> > Could you please add more information to the patch headers [1]. Like,
>> > were do they come from, links to more information why they are needed
>> > and possibly upstream tickets or commits.
>>
>> its already there in the patch headers.
>
> Just for `sh4_set_fpscr.patch` and not for the other two
>
>        sh4_set_fpscr_2.12.patch
>        sh4_local-fpscr_values.patch
>
> as far as I can see.
>
> And looking at [1] from `sh4_set_fpscr.patch` this patch looks like a
> subset than the one in the Debian BTS [2]. So if this has been applied
> upstream yet I would prefer a link to the commit.

The part of sh4_set_fpscr.patch is already taken in by upstream. And I
sent the other parts.
And I am going to have I cooperate with codesourcery and adopt
sh4_local-fpscr_values.patch.

>
> I am sorry to bother you with this. But this is my perspective, a guy
> who is not involved with this library a lot. But when I am facing a
> problem with the library and try to get an overview it will take me more
> time than needed to get around everything because the documentation is
> lacking. So please tell me what I am missing. ;-)
>

Yes=EF=BC=8Cyou are right. I lacked sensitivity.

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu


