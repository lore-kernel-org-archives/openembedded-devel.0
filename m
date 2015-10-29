Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1E46673695
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:59:52 +0000 (UTC)
Received: by lfaz124 with SMTP id z124so17571047lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm_se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=6YISY2y6qUlnGMN/PWhOSUaIG98ZcSW3BwpbJ66dUMo=;
	b=IsYcMj3xr/1kgoK2S2MeY3qs+otyjyVHqBVA/9GQDpwCg5PWRf4bti05htyKj9C60R
	VPcoak4ZxgBqSZsXqioaaELltXQUeEqqFcBTpZpPPHqL9tKeDVB+zZWqCMH+1T6Ay/Mw
	5s4HLF2ACv8uBDUr/KGhBjtxa9pHq7mcwc1UBKvyI86ikfC3xVBEyWW3r2iYLkCI7MJz
	ID0AKQCOe6NtUOIbqyu2/j3U/QoB2r+njullUH4RuEsci+CaAqAkcAaCMltlnXBDahdi
	JQ6VBak7w2v4jxUrm2w7POWHACd+iFQ3d659jaftDMe4y65+zM034XkS+/4IJxkF9O7S
	Z2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=6YISY2y6qUlnGMN/PWhOSUaIG98ZcSW3BwpbJ66dUMo=;
	b=BpyUAnvGsdUpmeTz0jfiWWOq7sjZ7l/GwXhSuyPXLYimQfrhTMBuns5Giudr7ilP38
	C+ZLbqfy2SkTC6PrfhHuc/R1DkVOu9oGnxdCIDI3/YG3jD3CMGWJm5+fJ1cXeuFAMZDb
	90tgvroR6gDa+d3pErRJb+U8tTgtOIkr0dCSpBhe+Tu8GT2MGgSw7LcDBYe0aJyK0zMw
	DZcaTZWj58twfQFQbag7IMqaaD0uLrxhEzk+JBLXugLzkinJVMQCQAzRFIUhAS0XW9HY
	/vi7uUM2Kiqsi+vUl5tNe01huEcDwTeEPjD6tnTh8WS2NGOrxZET/GeTQQ0QVqtr+j50
	Ne0w==
X-Gm-Message-State: ALoCoQmqxITH2KRop/QjcTSqvYA947N+Uw5FWDwa7pHIiLiunydLmCuDBpmRN6gByOTLOgRDiKIZ
X-Received: by 10.25.85.193 with SMTP id j184mr489700lfb.2.1446119991831;
	Thu, 29 Oct 2015 04:59:51 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id g65sm256468lfb.11.2015.10.29.04.59.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 04:59:50 -0700 (PDT)
Date: Thu, 29 Oct 2015 12:59:49 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151029115949.GC27480@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
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
X-List-Received-Date: Thu, 29 Oct 2015 11:59:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


How long have you been using OE?  6 years

How do you use OE/Yocto?
[ x ] product development
[  ] hobby/research/education/yocto core developer, etc

What distro do you use?
[  ] Poky
[  ] Angstrom
[ x ] nodistro or custom

How do you organize multiple git repos?
[ x ] Git submodules
[  ] Repo
[  ] Other

What packaging system?
[ x ] OPKG
[  ] RPM
[  ] Other

What GUI toolkits?
[ x ] Qt
[  ] Gtk
[  ] EFL
[  ] HTML5/JS
[  ] Other

What init system?
[ x ] systemd
[  ] sysvinit
[ x ] busybox init
[  ] Other

What libc?
[ x ] glibc
[  ] uclibc
[  ] musl
[  ] Other

How do you develop custom applications?
[ x ] application-SDK
[  ] devshell
[ x ] develop on PC, test on target
[  ] Other

What language do you primarily use for custom applications?
[ x ] C
[ x ] C++
[  ] Python
[  ] Javascript
[  ] Lua
[  ] Other

What do you use for Continuous Integration?
[  ] Buildbot
[ x ] Jenkins
[  ] Other

Do you use any any of the tooling projects
(https://www.yoctoproject.org/tools-resources/projects) such as ADT,
Hob, Toaster, etc?  None yet.

-- 
Anders Darander
ChargeStorm AB / eStorm AB

