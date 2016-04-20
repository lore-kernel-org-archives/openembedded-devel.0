Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C117460762
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:04:27 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id e190so36012223lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=R8zEQkuAr3kMoobH1evuD+Cr3MH8h8Beq0W8yD/jOrQ=;
	b=xsVB1MLyo7KqhN/HZ8YB1RLzsMqv8KfarhtxgiBb3bVv08dx/8kSS4UDWQR34RaOkr
	A4ZxvLFCpLoD8ny8i3gkPMFrpPb0nDFxni1oYQtHcgj430Bvd+5pQbtX8uClB47Lrzrd
	zCLISe5hLkSsO8Wf9dXR2M2d4wJwmAxG1SiAJ8odhyglDnKCYrDS1A9KomyLDB8nOoPA
	hmxy+E+sWGhRhvHKoE1zSU2x3+me40naFkrPSZawcWWZfiXhRuQugR6zG6BwoizulFc1
	KCWNaFoHZN8kGNy945uZI1LG2aFMow4i5n4A29TNNp4q4EfW3YITYrJjMLtP6IxklOsj
	+GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=R8zEQkuAr3kMoobH1evuD+Cr3MH8h8Beq0W8yD/jOrQ=;
	b=bUx0TFcMLve3QOmWiWEOdOyIZe4QRFp3CCH2a22Adtv0oQTkzAbk/QtUDeu0lLRgRG
	pzX6F+5Iki4vrBfbCdG5I53uM2b3LrKYhpE+QZ7yLXHFBc219xLCZQNWlO59PqwLG5qt
	dFnXh4VgH0zII+B2NEqBz0N5Oaxtv0pz7hYjlxmWw+Gjj5dgBOyUK/gPGlPMQupsSJMl
	VAxw34X0h5BEU0f76uBgxvmxEQHiChTtdV5SRGn62A4wD5oT/wheloftVyTYz3dXz/je
	Ml3AL0Hep50x/Ip2rViJTz8ncqFevkbsgEL4Ww0vLkBe8GqnfFcOYbxhMMPvx3BibR+w
	Gqnw==
X-Gm-Message-State: AOPr4FVd3YG3M/X0DP7LEDg6Coysc14Q0jfUNO+fHO0MqD/0n6QGs18uOHCX87lh75ryIw==
X-Received: by 10.25.88.133 with SMTP id m127mr2577971lfb.156.1461139466419;
	Wed, 20 Apr 2016 01:04:26 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id d74sm836350lfb.49.2016.04.20.01.04.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2016 01:04:25 -0700 (PDT)
Date: Wed, 20 Apr 2016 10:04:24 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160420080424.GA3520@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAMZfsd5MAhEiAw7YsMuS0bv1AMKh3ZTONV0tW5E+U83UvQN4nQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMZfsd5MAhEiAw7YsMuS0bv1AMKh3ZTONV0tW5E+U83UvQN4nQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Wed, 20 Apr 2016 08:04:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Ryan Elkholy, PhD, PE <ryanelkholy@gmail.com> [160419 18:26]:

> It says it cannot find qmlplugindump, but I clearly see it in the path.

> Regardless, I went along and I manually chose the compiler/debugger/version
> using the SDK and made a kit for my target. After doing so I made a sample
> app that required the following:

> Qt += quick qml

> After trying to build I got the following compiler errors:

> "
> Makefile:659: warning: overriding commands for target `install_target'
> Makefile:650: warning: ignoring old commands for target `install_target'
> Makefile:663: warning: overriding commands for target `uninstall_target'
> Makefile:654: warning: ignoring old commands for target `uninstall_target'
> g++  -o testapp main.o qrc_qml.o   -lQt5Quick -lQt5Gui -lQt5Qml

It's still using your hosts compiler.

> -lQt5Network -lQt5Core -lGLESv2 -lpthread
> /usr/bin/ld: cannot find -lQt5Quick
> /usr/bin/ld: cannot find -lQt5Qml

The same for ld.

Check your compiler configuratin in QtCreator again.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

