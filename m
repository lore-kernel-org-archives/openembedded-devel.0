Return-Path: <cliff.brake@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD4477041
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 19:18:55 +0000 (UTC)
Received: by lfbn126 with SMTP id n126so126059498lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=6I0Tj/rRCWV7+GxTq2cqiXHqxlAQARka+YRUgmsH15E=;
	b=cpUdIehJC9Z8a7k2hmCEIM641JPOwQ4dhgZO8uzEIlnJOtBa0AImOhUA/A9530fR2T
	KGPRede795JrAK34NhjliafCDuyfEuScWPOELpS7FH+YTeq6ZdwLMkzv6EaWGu1VSKdA
	5/FSVbJ2SQo2GG8hzYyYbXYsLp76GnJ9zoMY3RYO3q5V6Jtt7vuP+wf/Y6vPDkBie8S8
	12voAhLybm/HwGkNYGrMvEh7fvAn2brFGOsvXi155b+kTrlNvX9ffI/H69nwWS2KyxJc
	VBNqBAnW0w5lURvJNL7+irMckFUuYIx0jkoCE71VWEpulY8z7mvkf4F5SznAEz1Sny9m
	uxCQ==
MIME-Version: 1.0
X-Received: by 10.112.11.163 with SMTP id r3mr17315377lbb.8.1445887134457;
	Mon, 26 Oct 2015 12:18:54 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.112.154.137 with HTTP; Mon, 26 Oct 2015 12:18:54 -0700 (PDT)
Date: Mon, 26 Oct 2015 15:18:54 -0400
X-Google-Sender-Auth: DwvnhjPG69e2FaT8s4UZz5f4_b4
Message-ID: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: OE/Yocto developer survey
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
X-List-Received-Date: Mon, 26 Oct 2015 19:18:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'd like to get some feedback on the following questions -- feel free
to respond to list, or directly to me, and I'll withhold your
name/company from any results.

I would like to collect feedback until 2015-11-02, and will summarize
the results after that.

My goal with this survey is to get a sense for best practices and what
is most commonly used among Yocto/OE developers so I can better advise
clients using Yocto/OE.  Hopefully this will also generate some
interesting discussions.

How long have you been using OE?  _____

How do you use OE/Yocto?
[  ] product development
[  ] hobby/research/education/yocto core developer, etc

What distro do you use?
[  ] Poky
[  ] Angstrom
[  ] nodistro or custom

How do you organize multiple git repos?
[  ] Git submodules
[  ] Repo
[  ] Other

What packaging system?
[  ] OPKG
[  ] RPM
[  ] Other

What GUI toolkits?
[  ] Qt
[  ] Gtk
[  ] EFL
[  ] HTML5/JS
[  ] Other

What init system?
[  ] systemd
[  ] sysvinit
[  ] busybox init
[  ] Other

What libc?
[  ] glibc
[  ] uclibc
[  ] musl
[  ] Other

How do you develop custom applications?
[  ] application-SDK
[  ] devshell
[  ] develop on PC, test on target
[  ] Other

What language do you primarily use for custom applications?
[  ] C
[  ] C++
[  ] Python
[  ] Javascript
[  ] Lua
[  ] Other

What do you use for Continuous Integration?
[  ] Buildbot
[  ] Jenkins
[  ] Other

Do you use any any of the tooling projects
(https://www.yoctoproject.org/tools-resources/projects) such as ADT,
Hob, Toaster, etc?

_______________________

Reasons or explanations are appreciated, and please feel free to
include additional choices/information you think are relevant.

Thanks,
Cliff

