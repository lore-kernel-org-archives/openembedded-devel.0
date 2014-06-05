Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8797B65E35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jun 2014 00:52:31 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hn18so6981096igb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=H1sTI12SLUkSXit+6EbzDy4/pty1suJgnb1Rb1vINMQ=;
	b=zI43LP0XCSVn2oxS8HUgQYlegqojOL5BzBKaUmpFyQqZYaKZzkWnnGufnZRbZggdyw
	DaNLyfipGP8eNDJXgxWw1VcUm6YqhGR6O7nkMIqVShSYC3u59Jrs2saSBWOCyAxvQhjB
	vQDBaEP9xB/upEEqW1SuWWG+7X04PrZarLiR/P1Mu0JnatD6azFddkKWRMD2fUVxOPkl
	izjPQlSlSjmt8O00fVQP0hOlriXg6olm1mT46ae9dpUMUNQ4nmF9tyyiBHw2xZ8TENB7
	hrpkfqeFSviuolGh9dcJGfVcgfJVN1+dzo5QbQlEyRjPWVaH8veaOpXaq+8UEjgYDQqE
	xpRg==
X-Received: by 10.50.61.141 with SMTP id p13mr13187157igr.38.1401929551961;
	Wed, 04 Jun 2014 17:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Wed, 4 Jun 2014 17:52:11 -0700 (PDT)
In-Reply-To: <20140604235300.GV2426@jama>
References: <1401878650-3362-1-git-send-email-chmorgan@gmail.com>
	<CAP9ODKoqUaswvNbhR02aX16EgKLmv6g6ws1Lkgpb00Gdmctg=g@mail.gmail.com>
	<20140604235300.GV2426@jama>
From: Chris Morgan <chmorgan@gmail.com>
Date: Wed, 4 Jun 2014 20:52:11 -0400
Message-ID: <CAAPegz3nTPdLcHPQjxcNyr-mV7+rR-mPZMP+ha6ddZ9StsPjwQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Remove dfu-util svn recipes, these point at deprecated svn repositories, dfu-util uses git now
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
X-List-Received-Date: Thu, 05 Jun 2014 00:52:35 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 7:53 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jun 04, 2014 at 08:38:35PM -0300, Otavio Salvador wrote:
>> On Wed, Jun 4, 2014 at 7:44 AM, Chris Morgan <chmorgan@gmail.com> wrote:
>> > Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>>
>> Please rewrite the commitlog to adhere to
>> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> In this case I've updated both commit messages when cherry-picking them
> to master-next, so no need to resend, but as Otavio says, please use
> better commit messages next time.
>
>

Sorry again. I didn't see that this one had landed in the repository
and I saw that it had wrapped lines so I resent. And thank you Otavio
for the link, I'll improve the commit messages next time and am glad
to rewrite the change or commit message if necessary.

Chris

