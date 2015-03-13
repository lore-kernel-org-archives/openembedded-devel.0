Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id D6A9F6013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 11:15:48 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so22012097lbv.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 04:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=uIj0zUgYv95Iiu37ZJ5KB+wYyVA5mgUT1Sc9ZhbtCHU=;
	b=btDSEucLoXeOLSRqdS7IZtM3j+RTxbIMJh6AOwLv8lJ3enT4XGw38ho8j7wFSNHYoy
	4aeYLNybJAO7pN/+E2eXDWZazqllCVSBMkUS9rGE6XhgLCTZSEOJXCFQmMdxa7suNHv8
	ynrruPmWOXXmANOyKEfMBQWvWMilGySfcB8H5vpbc4P3p605hIHtM6KjWmr+NTKItjoU
	FibIYMsx9SLqSr0O2vaIgwXqrJVZVXCKtkI9rjb/c+HJ7tDO8a9JKDm3FxydvLqc5MmF
	3V13OgCHLIYuch0Oo2LObRuDtEJO5JMIL6ogGpwakcL66NPCSrfqqi5hK4goml4z6769
	D1qw==
X-Gm-Message-State: ALoCoQnjWw58V5yw1roP2jtAtD25h9LGhAyE53iwYY/PF8HrabjdF5eVdMxVJFDlSrXcdbJrLFxU
X-Received: by 10.152.225.167 with SMTP id rl7mr43625997lac.54.1426245348422; 
	Fri, 13 Mar 2015 04:15:48 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id je5sm333692lac.33.2015.03.13.04.15.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Mar 2015 04:15:47 -0700 (PDT)
Date: Fri, 13 Mar 2015 12:15:45 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150313111545.GD6751@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Fri, 13 Mar 2015 11:15:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* Kai Ulrich <kaiu@gmx.de> [150313 12:09]:
> I created an layer with a recipe for smstools3.
> You can find it on https://github.com/kaiulrich/meta-smstools3
> I would like to share my work with the openembedded commity.
> How is the process to add a recipe to meta-oe?

Well, decide were in meta-openembedded it ought to be placed.
E.g. which layer, meta-oe or some of the other layers; which section
(recipe group) it should be placed in.

Create a patch and send to the mailing list! 

Wait for feedback... ;)

Just as simple as that. If someone thinks it should be placed somewhere
else, it's up to them to respond and let you know.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

