Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 29E4C772F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:19:55 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so22630591wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=FDXgdyXoMKIWUO3iuqLp8uks3ky7TIdQK8u9iWXM1Is=;
	b=MOAOeCxjkCPYQgEVJQW7t4vZ8GWJ6/AsnrJOZQkjjxB8LwfOOzg3VfPjOqFTmOoydm
	FwkOreBMBsE1Tx82H78awMM3rUWuROwiQ3/FzzYpTqTOi08J0sM1oll+ChmezdKxsHKV
	o4M5lO9MFLu0zbQqp58NM68+gnABPhsHNHn+wzK3RkNySoxmn/rpkfKMYTC5KZPOiPxe
	hoKx7efAaX0L5Bl8/5FKnUgIKm4foBPAS5laJzYQyz4pzoeidLpCXTftw+T9JRH9hs3h
	BHvTRjtDda3RWY1fz78q4IclhcjD2kL91EkCohkBXoj5KaEw10I6AtzlzXNCzI03Gvcz
	bccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=FDXgdyXoMKIWUO3iuqLp8uks3ky7TIdQK8u9iWXM1Is=;
	b=fb7GOxdbBKZ6fidzR82+4Wgw258n0Ds9Qx3LOSjrlGbZzLjyRjdYMTNbp7K+YOeYr7
	Ml1qplERpEJAzv9+IrcBC36S+5QQ/RTIVCJwCtUJA2X6ZmUE/cxvUV/fyz2+HMYkGmtw
	dJ8u1rR2hGZkVytJNNGbOfF1By9gBO8tkVJI6IJbr/O1jXPItQvEB0CdYhdHw2yV79Pj
	KhDAUcu1Y776SQ8hVXMGzKhtc8U8WR4b8dnkEDyold2nQl3xkLhD6S2+rfYm80dyQ2YQ
	+o1v47VfCxNCHBIFBdzE3NL58lGQvs8DdyR+9YvcmKCUvPgGOjh6MVFV0XQn1VYsYlZj
	EM/w==
X-Gm-Message-State: ALoCoQk3GUzWxUBdjnTXtfV2NnQC7v+GrMKwOo0C4AI2tsq/I0KlC10A1/nDJNFd3VP/+oGq0csT
X-Received: by 10.28.24.144 with SMTP id 138mr2649030wmy.43.1447409995547;
	Fri, 13 Nov 2015 02:19:55 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	l1sm3225880wmg.21.2015.11.13.02.19.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Nov 2015 02:19:54 -0800 (PST)
To: openembedded-devel@lists.openembedded.org,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Cliff Brake <cliff.brake@gmail.com>
References: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <5645B949.6030900@dresearch-fe.de>
Date: Fri, 13 Nov 2015 11:19:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAOd_LFwgMqDUBKzxjs50G+=F0TgFg8ZuoCBX6jqs6p8fLFQibg@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 10:19:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 26.10.2015 20:18, Cliff Brake wrote:
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
> How long have you been using OE?  _2008_
> 
> How do you use OE/Yocto?
> [ X ] product development
> [  ] hobby/research/education/yocto core developer, etc
> 
> What distro do you use?
> [  ] Poky
> [ X ] Angstrom
> [ X ] nodistro or custom
> 
> How do you organize multiple git repos?
> [ X ] Git submodules
> [  ] Repo
> [  ] Other
> 
> What packaging system?
> [ X ] OPKG
> [  ] RPM
> [  ] Other
> 
> What GUI toolkits?
> [ X ] Qt
> [  ] Gtk
> [  ] EFL
> [  ] HTML5/JS
> [  ] Other
> 
> What init system?
> [ X ] systemd
> [  ] sysvinit
> [  ] busybox init
> [  ] Other
> 
> What libc?
> [ X ] glibc
> [  ] uclibc
> [  ] musl
> [  ] Other
> 
> How do you develop custom applications?
> [  ] application-SDK
> [ X ] devshell
> [  ] develop on PC, test on target
> [ X ] Other
> 
> What language do you primarily use for custom applications?
> [ X ] C
> [  ] C++
> [  ] Python
> [  ] Javascript
> [  ] Lua
> [  ] Other
> 
> What do you use for Continuous Integration?
> [  ] Buildbot
> [ X ] Jenkins
> [  ] Other
> 
> Do you use any any of the tooling projects
> (https://www.yoctoproject.org/tools-resources/projects) such as ADT,
> Hob, Toaster, etc?
> 
> _no_
> 
> Reasons or explanations are appreciated, and please feel free to
> include additional choices/information you think are relevant.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

