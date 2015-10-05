Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA2276BE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Oct 2015 14:40:59 +0000 (UTC)
Received: by qgx61 with SMTP id 61so151321842qgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2015 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=52Aa5kMNAq5UBpEFvLzujpNfrUWcdY2awfKVFnQTYBA=;
	b=k64I43TFXnx9Y1ilqwkdY6Jx6b/onJAmI6G7volfQy1aHUCEscpiblnZu5c3FC543k
	QYt5qofajYuljKwNc0DIJ0E4o4Mu76ggElwUeEneDYgYuZKLmI7G2/ms8IfHnzG1UgQM
	TqUPQy7NyEfw1jx1grGSBd211bYaWjDXC18opPrOy2GAzevNzF5gQA+GUgJ5Wenh7eAF
	gwNQESdxspOI2JNpcm/STuYdKZzIMU60Opc92yvjZEAlkyqUNFIID5DUHw0RuVvkzBoi
	s6HqADLZXgWXNq09jNfkWbi/DpgaIt0pTPl3PqMjylFMa0usZXtqDPL1zIw+6GCFbyaC
	e2OA==
X-Gm-Message-State: ALoCoQlcljVEUOX2Afq5OFOveX5KbcUp9lcCBUm8q8GBN2+1zIwYgDldqOKoGzf9qjIykctmlghq
X-Received: by 10.140.147.77 with SMTP id 74mr36286693qht.52.1444056059361;
	Mon, 05 Oct 2015 07:40:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 5 Oct 2015 07:40:39 -0700 (PDT)
In-Reply-To: <20151003133343.GC2381@jama>
References: <20151003133343.GC2381@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Oct 2015 15:40:39 +0100
Message-ID: <CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Mon, 05 Oct 2015 14:41:00 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2015 at 14:33, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb,
> do_compile
>

This fails with a giant number of assembler warnings, but works when I try
with current master.  Does your build change some tunes?

Ross

