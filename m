Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id D0C197199F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 10:59:12 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id c7so76551272itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 02:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=zDc+5lSny5MvKMUx+ElxVyUvTRirldneUaB6JkCjZvw=;
	b=EXZ5+kxdMdUqG4Tn0tf1pUPzN/MlgoZEF6z/g0PH9zzfw+p78+C1qS44gimatanDYC
	uQ0zK5CXWLsvCsDiw7JzmKwx9F+OHcg5ixJoAP2nFwnGhmyZX5ZpwxuH1z5Pc+hWkHqQ
	t3/T0io+LMMc0GPx92XyW019u7xi9VSOuBHFhI5fho92Sdw4YPUiZYXNUYwVr5We53WD
	VtmAWChAr1TbmJt4ijK3Kd9SGsGIAM7lJWa9Jj/Qa/PpoH7Gp60nEix/oiQ5lIhNMc+y
	X6V+mRhTg5CqVMIab42pP9SkOY/lddl4C4P2+lUotGvciJKx2so8RCXUq8Lc/fVM1LZK
	7LYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=zDc+5lSny5MvKMUx+ElxVyUvTRirldneUaB6JkCjZvw=;
	b=RK6AiFMo7hx14JHEDj7YZcyRy4VUBfPfLtviSN2Zo32zquXb8aAlaOdh1ne436Fb1D
	4tIwkbX7WAGavJzJvhJE9vLMbqCdwUoI+2fXnu7fJd6yDQuf68ZfL9cH9JU5NE+obLAL
	5oHM/oz/BooOARbJIpVkVQEQv9/cHsrRx/D4V9oXvChjlNAZemdhps5gmiMVweOaZ6h5
	20jFy1gNOUJVzyNpjNLSlsZoRgtFDQWGOOKgG2+vwFDKWD9tZvJM3k/GdKtsatLimiAa
	uByBCItcHHeopWSqw0ml7Dn429FfL+G9PC4N5ZD0KrXv8aTq1KIC4vnIklJXdfqVpuCU
	lOEA==
X-Gm-Message-State: AIkVDXK432D5KVKyX5vOhGve616rIklubPanqhWNvv/C67BGec8ILkILgOO9RIToDnyYBwWb
X-Received: by 10.36.139.133 with SMTP id g127mr10576953ite.4.1486465152792;
	Tue, 07 Feb 2017 02:59:12 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DF93.dip0.t-ipconnect.de. [93.232.223.147])
	by smtp.gmail.com with ESMTPSA id
	x128sm5858613ite.11.2017.02.07.02.59.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Feb 2017 02:59:10 -0800 (PST)
Message-ID: <1486465148.14889.140.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org, Jose Lamego
	<jose.a.lamego@linux.intel.com>
Date: Tue, 07 Feb 2017 11:59:08 +0100
In-Reply-To: <20170207102518.GA3276@jama>
References: <1486399174-28949-1-git-send-email-akuster808@gmail.com>
	<caa1a269-b4e4-9909-967f-c637146fc4ba@gmail.com>
	<1486453274.14889.135.camel@intel.com> <20170207102518.GA3276@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Patchwork-Status via email (was: Re: [meta-networking][PATCH] crda: fix build issue do to missing python module)
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
X-List-Received-Date: Tue, 07 Feb 2017 10:59:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-07 at 11:25 +0100, Martin Jansa wrote:
> On Tue, Feb 07, 2017 at 08:41:14AM +0100, Patrick Ohly wrote:
> > On Mon, 2017-02-06 at 09:10 -0800, akuster808 wrote:
> > > please drop. this is fixed via a change in master-next.
> > > 
> > > http://cgit.openembedded.org/meta-openembedded/commit/?h=master-next&id=2e83e33c592543045a7761907d8cd62937e1e60d
> > 
> > Let's see whether the magic keyword works :-)
> > 
> > [Patchwork-Status: Superseded]
> > 
> > https://patchwork.openembedded.org/patch/136794/
> > 
> > -- 
> > Best Regards, Patrick Ohly
> > 
> > The content of this message is my personal opinion only and although
> > I am an employee of Intel, the statements I make here in no way
> > represent Intel's position on the issue, nor am I authorized to speak
> > on behalf of Intel on this matter.
> 
> If it was supposed to update status on Patchwork, then it didn't work
> it's still in "New" state.

Jose, in your "parsemail: Set patch state from email metadata" patch you
said that it "allows project maintainers to change a patch status
directly from an email message".

Can you clarify who the "project maintainers" are who can use this email
interface?

What about this use case here: the original author wants to retract a
patch. Can he do that via email and/or the web interface?

I wasn't the original author and probably also no project maintainer, so
I guess that's why my email had no effect. Can we enable some kind of
error response for such cases?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




