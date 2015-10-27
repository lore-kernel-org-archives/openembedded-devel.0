Return-Path: <k4230r6@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id CEF12757AB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:12:50 +0000 (UTC)
Received: by wijp11 with SMTP id p11so201039613wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4DwJddTLzCMZpEzlZXSFDxJGHjcV9rf7IPcmfIXr4MM=;
	b=yTmaIQ6+Nb1guCsEbgavPazFseQ9Zc62x6u9oNzIPNldyjKSnaHcZkoOdVjbt5DrKu
	lin9ZDpKe3KtmAt5M4EWP7MgkV0+fefIfdpJCnZkhJfAYMV4h0IPs7iH68BrfZwjqHZl
	WZf+k9PFtqA07fMtY6k6oo49QV2gjwoI+WtCyuNphwPXwDRi7uuYVAL672CoZiUMwT/Q
	ZmVVp0MP1B9Rf1LNls9GeRE8ASpZW02LFBmKh1rmhmLw97qNS9WMqmFLZUolCUGk0tA2
	oVxBbQ5CiG4uMMnjqDeLEQnFik2RtVU3lfk6EtO4RC6yyjB8xn2WIMqw0q0iZR7cHbZE
	jRKQ==
MIME-Version: 1.0
X-Received: by 10.194.91.143 with SMTP id ce15mr28173468wjb.93.1445933570617; 
	Tue, 27 Oct 2015 01:12:50 -0700 (PDT)
Received: by 10.27.173.133 with HTTP; Tue, 27 Oct 2015 01:12:50 -0700 (PDT)
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
Date: Tue, 27 Oct 2015 09:12:50 +0100
Message-ID: <CAALGJZa6rpHiDaZxgiHDEbphFBBB7snjAfJO_EadvreXO_t4Qw@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE/Yocto developer survey
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
X-List-Received-Date: Tue, 27 Oct 2015 08:12:55 -0000
Content-Type: text/plain; charset=UTF-8

> Hi,
>
> I'd like to get some feedback on the following questions -- feel free
> to respond to list, or directly to me, and I'll withhold your
> name/company from any results.
>
> I would like to collect feedback until 2015-11-02, and will summarize
> the results after that.
>
> My goal with this survey is to get a sense for best practices and what
> is most commonly used among Yocto/OE developers so I can better advise
> clients using Yocto/OE.  Hopefully this will also generate some
> interesting discussions.
>
> How long have you been using OE?  __3 years___
>
> How do you use OE/Yocto?
> [X] product development
> [X] hobby/research/education/yocto core developer, etc
>
> What distro do you use?
> [X] Poky
> [  ] Angstrom
> [X] nodistro or custom
>
> How do you organize multiple git repos?
> [X] Git submodules
> [  ] Repo
> [X] Other
>
> What packaging system?
> [X] OPKG
> [  ] RPM
> [  ] Other
>
> What GUI toolkits?
> [X] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
>
> What init system?
> [X] systemd
> [X] sysvinit
> [  ] busybox init
> [  ] Other
>
> What libc?
> [X] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
>
> How do you develop custom applications?
> [  ] application-SDK
> [  ] devshell
> [  ] develop on PC, test on target
> [X] bitbake <image> -c populate_sdk
>
> What language do you primarily use for custom applications?
> [X] C
> [X] C++
> [  ] Python
> [  ] Javascript
> [X] Lua
> [  ] Other
>
> What do you use for Continuous Integration?
> [  ] Buildbot
> [X] Jenkins
> [  ] Other
>
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
>
> __NONE_____________________
>
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.
>
> Thanks,
> Cliff
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
http://ch.ege.io/

