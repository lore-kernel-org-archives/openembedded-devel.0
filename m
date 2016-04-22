Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 733EF605BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:25:10 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id f89so103827253ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=O8FYZl/6MbZfezlOoy96KgZZ+K8qPUFLZrt5rpZi3eQ=;
	b=nozPAY2rkcLl6GFQyxvtqEq9FKWY8PAsWUqF20h1Sy51frblryRUg/HpXWgG3Fk2wn
	uC/oGOuKE7eBr8aQHP3L0UOhukFDc6G9tr/ynUXJpZcGRxRg8H5T/R4SeRX8ODbjy65x
	HghHbvtUJaCk1OVn+Y+sg0CNbwJX9cF99j+drF3KanVeTqy9GdqZbAlAZlBGa0FoPmH5
	ocBQMQdX+LnyfR9MvXa6SV5OOaf/W2vF9SCkw7A+ZKykxvhfdCs2FvWVQCDiigkqLwgv
	FG+jsidJGRG1YxoqLZuR3EYQ1siyhbFfasXvcBnIjqjvujOcByoASvAl0SH3/76NsTBn
	gAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=O8FYZl/6MbZfezlOoy96KgZZ+K8qPUFLZrt5rpZi3eQ=;
	b=f3YbXAZuxktS1rGxcp0nujt5f/tz5wL/uOCiPbviU8KgG4uEKbqwx2sib6L5U7bcwd
	ZuNi23f/gkpphjYKKIaQn+2ePKVeCeIyR9QUcUO4HPErmqSxkmd5MG5D2lVcKQhuR9k4
	rG5r2Ms9hcmOF7m52T/5UKtwG8IeCBUVck0qYg5KpcpV53ufPwkrJXP2SXt1dDnj3kEw
	Riq1hXsCymLzg8AxCKCOU9NduTxf2TTxnRruSIYOkynargf1k7/o9Yh+LjlHSKnt7Jl6
	S+rEFTEBhIHCcxq4HvKRnUvHYFLUbvmXXrjExhb5fKpCptbMOU4zka/z78dAiD7uFB/B
	IFYw==
X-Gm-Message-State: AOPr4FWu6TqxUpt8DLwNfy20w+A8JyjTxTgho7zcD1Bf3WeeAIBMzheaL9fse3KQ4Oa7xEcC8o3zMF/Yrj9gxA==
MIME-Version: 1.0
X-Received: by 10.107.18.232 with SMTP id 101mr11578197ios.157.1461353111400; 
	Fri, 22 Apr 2016 12:25:11 -0700 (PDT)
Received: by 10.64.78.105 with HTTP; Fri, 22 Apr 2016 12:25:11 -0700 (PDT)
In-Reply-To: <BCF6D77D-444E-4998-A0F7-BD3CC7DDFEBB@gmail.com>
References: <CAMZfsd5MAhEiAw7YsMuS0bv1AMKh3ZTONV0tW5E+U83UvQN4nQ@mail.gmail.com>
	<20160420080424.GA3520@ad.chargestorm.se>
	<BCF6D77D-444E-4998-A0F7-BD3CC7DDFEBB@gmail.com>
Date: Fri, 22 Apr 2016 15:25:11 -0400
Message-ID: <CAMZfsd7HqzzwZRsWb8Kf5KXdfiSYMmudF_b9D2+rwBVyOqU6TA@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Qt SDK seems to be broken
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Apr 2016 19:25:12 -0000
Content-Type: text/plain; charset=UTF-8

Any response?

On Wed, Apr 20, 2016 at 6:31 AM, Ryan Elkholy <ryanelkholy@gmail.com> wrote:

> Thanks for the quick reply. Is this something that is wrong with the
> toolchain or is it configuration of QtCreator? If QtCreator, what do I do
> to fix it? Are there specific variables in the Project's build environment
> setting that I should look at?
>
> Also, if that is the case then this would have to be done on a per project
> basis. How can I fix it in the toolchain so that it is automatically
> detected and corrected in QtCreator?
>
> > On Apr 20, 2016, at 4:04 AM, Anders Darander <anders@chargestorm.se>
> wrote:
> >
> > * Ryan Elkholy, PhD, PE <ryanelkholy@gmail.com> [160419 18:26]:
> >
> >> It says it cannot find qmlplugindump, but I clearly see it in the path.
> >
> >> Regardless, I went along and I manually chose the
> compiler/debugger/version
> >> using the SDK and made a kit for my target. After doing so I made a
> sample
> >> app that required the following:
> >
> >> Qt += quick qml
> >
> >> After trying to build I got the following compiler errors:
> >
> >> "
> >> Makefile:659: warning: overriding commands for target `install_target'
> >> Makefile:650: warning: ignoring old commands for target `install_target'
> >> Makefile:663: warning: overriding commands for target `uninstall_target'
> >> Makefile:654: warning: ignoring old commands for target
> `uninstall_target'
> >> g++  -o testapp main.o qrc_qml.o   -lQt5Quick -lQt5Gui -lQt5Qml
> >
> > It's still using your hosts compiler.
> >
> >> -lQt5Network -lQt5Core -lGLESv2 -lpthread
> >> /usr/bin/ld: cannot find -lQt5Quick
> >> /usr/bin/ld: cannot find -lQt5Qml
> >
> > The same for ld.
> >
> > Check your compiler configuratin in QtCreator again.
> >
> > Cheers,
> > Anders
> >
> > --
> > Anders Darander, Senior System Architect
> > ChargeStorm AB / eStorm AB
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

