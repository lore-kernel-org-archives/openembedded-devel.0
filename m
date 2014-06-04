Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 025266FBE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 14:24:54 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id f51so15585845qge.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 07:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zSvbDLMdFT0xr4qJSvRCt9EMIS3f+kdbRChGoIeEWck=;
	b=WmiFRXBjr7KrWuRSSGHCxj6NgA76w96HJ/ptQvRmuGrnSjOrzkQSsVerQA2DfUosUi
	Jl+oeiRDTITsgzvCUcRe47AV1Z/EgKfjgPK6E3DU2A5Hk1zCAt0bcJvhmoaAXUU8YK3Q
	4BeWHjKZwS1tAbJIXMhlsEDZ4y/TsnloZgA4fl88r9A7WFiqu2PW2rZb9LdgcDE9A17A
	S+MXSRNCZvlyTUaRXdO57EuTNw8XsLMlQM95EwFDcOgoAxkZ6RoofDxyXY0VhGu0uQiX
	s3xpweosJZbwIZNI8cf8Wk9Jlgv6xYKkuozo3Lwlak/7jHGzp2xUFiFK1EmZzIwh4zp4
	8siw==
X-Gm-Message-State: ALoCoQkK9WQhU81J7GR3ugYK3D1bedd7SYX1XPJ3i13MjOHF1PbHijRRoVJTac9SkKfd2bi84o0d
X-Received: by 10.140.25.37 with SMTP id 34mr68414744qgs.60.1401891895017;
	Wed, 04 Jun 2014 07:24:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Wed, 4 Jun 2014 07:24:34 -0700 (PDT)
In-Reply-To: <20140604125205.GS2426@jama>
References: <cover.1399993010.git.valentin.popa@intel.com>
	<CAJTo0LaNVqizccFhw8E_Bp8WXX07ZB9Mu+_DoQ0tmjcLf8f=Fg@mail.gmail.com>
	<20140604125205.GS2426@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jun 2014 15:24:34 +0100
Message-ID: <CAJTo0Lab7wwV2NN=NSMqLYTxeW=_CfeGwvETkDCh4emwVRLxFg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] mesa upgrade
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
X-List-Received-Date: Wed, 04 Jun 2014 14:24:58 -0000
Content-Type: text/plain; charset=UTF-8

On 4 June 2014 13:52, Martin Jansa <martin.jansa@gmail.com> wrote:
> Sorry for hi-jacking the thread, but since today even the older 9.2.5 is
> failing to find native python-libxml2
>
> config.log:
> configure:8059: checking for python2
> configure:8075: found
> /OE/build/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python2
> configure:8086: result: python2
> configure:8103: checking python2 module: libxml2
> configure:8112: result: no
> configure:8118: error: failed to find required module libxml2
>
> Any idea why it started to fail now?

Great.  Can you share the config.log?

Ross

