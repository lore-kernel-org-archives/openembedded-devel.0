Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0603D6E87D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 18:25:37 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 20so25643272yks.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=oIP1WqGvhZ5+wg7liaz9JC7Ra7Ya9mjFiqiZJlg28Mk=;
	b=JKu7BSRkGMD87uO0kiNIOSuxtSZPjGKGXQfQfV05tQOzQ+xdx6gi448hrCEsaWoEbE
	554oFVTes10KS9hD7/snuYeDD6+hdfHshLIaXbPZ6maEcPOppBeLka6vL5bSUbN2E1/E
	W5kLVdtnmAkwdy4pfL1w5VcNfN6JjsV9FHk7AaZO5MWl57TqkVx5wIkodDWwgZBkzgrq
	XEwEnzFqA80a578+hzpFzHs+Fqpy5BCO+3IyUeIJ4ie+rI2P2rwhiub2cpT+u37qkP8c
	6oMVNTQvf8tOAjHqwj2WppcB+1z0xxMzSVskJj3yUAW3bcBvEkcYbNoSNB/rFf5O6KvT
	/oxg==
MIME-Version: 1.0
X-Received: by 10.236.96.201 with SMTP id r49mr19797282yhf.33.1391192737994;
	Fri, 31 Jan 2014 10:25:37 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.62.84 with HTTP; Fri, 31 Jan 2014 10:25:37 -0800 (PST)
In-Reply-To: <CAMCfZKFfbiwPcUoVAwKXYfFLosXHDBwKbV9F9vw0h3jZBU9KHg@mail.gmail.com>
References: <CAMCfZKEwQWimV0j8FE1Z1KVW=xUCZgR36_Li1fNuiZfwYm7yrA@mail.gmail.com>
	<CAP9ODKp_JRLSYgh_LrUjtsUkG9_FLibNbmYuoa-gPRkVxyLxqg@mail.gmail.com>
	<CAMCfZKFg-39ZX0hpWxbYLQSz0eo-6NW9This3Kcg6D600-w9Yg@mail.gmail.com>
	<CAP9ODKr+PSfPthrzi+khaFKVUU4FFNYY-Dop03mhjmFphBSnDw@mail.gmail.com>
	<CAMCfZKFfbiwPcUoVAwKXYfFLosXHDBwKbV9F9vw0h3jZBU9KHg@mail.gmail.com>
Date: Fri, 31 Jan 2014 16:25:37 -0200
X-Google-Sender-Auth: RLx-zB7_7a1lCyBjbvS90RJPJ0g
Message-ID: <CAP9ODKo-WEdwxyBEqV1zm2teAf9sF4R087ouwfEnTg1CrtmKyA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Systemd journald (206) storage issue
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
X-List-Received-Date: Fri, 31 Jan 2014 18:25:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Diego,

On Fri, Jan 31, 2014 at 4:09 PM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> On Fri, Jan 31, 2014 at 3:47 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:
>
>> Yes, properly document it in commit log and tag the recipe as
>> 'for-dora' so Martin and Koen follow it.
>>
>
> Thanks.
>
> This is going to be my first contribution and maybe I'm going to do it
> wrong.
> When you say "tag the recipe as for-dora", this should be done in the
> commit log, recipe name, or a git tag?

In the 'format-patch' call.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

