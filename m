Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07BCA6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:23:34 +0000 (UTC)
Received: by widex7 with SMTP id ex7so5113176wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 04:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=DTAHijb65vPVZXkt+JC+H4qidjRuLKGudLKDrULP8/o=;
	b=P4GPYdXM5Sbiew353m5eQXVCW5sy4jyM0TYLPCZOzgFFmLwcny7qKaPrBuVb04Pm//
	1/lL7dwBqAYte6LVLgUXkhiYge6QaXGKuqpr5/wK0gRkhKJ6F8xudRAHFCjsN9qM6rKl
	nksYiyEaahpYTp5YE86B6H42JCnoSQ+djDMtAaDBV7FpA0L4GBUS4kSY3Xp8mf4evbIG
	IQeuVyi45JNDw5J1WUL7w0yggkJOsboHEH1wJ2YPych4zjmcMi+5j4ksnAqXNqwEzrwf
	3zNY84cJ6ZuxopKXMks0XztCjX07wPQpj8cNAaa/4Ejxim1AhVSnegExPDMW5Vbw6Lv+
	Z7zA==
X-Received: by 10.194.200.68 with SMTP id jq4mr97000380wjc.58.1426245815034;
	Fri, 13 Mar 2015 04:23:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.13.5 with HTTP; Fri, 13 Mar 2015 04:23:14 -0700 (PDT)
In-Reply-To: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
References: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Fri, 13 Mar 2015 12:23:14 +0100
Message-ID: <CAGiJk9cTPf8TOg+h2rYbsT-Pvyo6EbDkR1_ps+dRPkx=43d9zQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: How is the process to add a recipe to meta-oe?
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
X-List-Received-Date: Fri, 13 Mar 2015 11:23:37 -0000
Content-Type: text/plain; charset=UTF-8

2015-03-13 12:08 GMT+01:00 Kai Ulrich <kaiu@gmx.de>:
> Hi,
>
> I created an layer with a recipe for smstools3.
> You can find it on https://github.com/kaiulrich/meta-smstools3
> I would like to share my work with the openembedded commity.
> How is the process to add a recipe to meta-oe?
>

See:
http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Also see the README file of the layer where you want to put the recipe in


-- 
Regards
Samuel

