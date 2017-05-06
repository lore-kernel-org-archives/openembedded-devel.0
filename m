Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76AFC60268
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 May 2017 06:35:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v4so94129wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 May 2017 23:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WSbS0kb9rVkK4b55a8VcE5jDbDYepaBGCiNjbFDrfj8=;
	b=Gx83uwuGwsRPA5jtr+BXxQU7jTs5peSB120SLCRto/xZ4BYbUqwqiVSOiXGeTQP2FP
	swZTY2Ccxpv8XxbiIrkj2LBqMjduhaL6lta1LzpfwteeX8aENqPij5h+JtacJtRT/i4M
	P+2X3je+muMHEqJZFSIRB64Iv/MgiqaOsydLkP4Vyvz2qDvOPjSnC2SMpDl5Jq17/H5K
	SLA+4YVtLY5pXhREVQz6DKGpdodY1GoQ8EpODLVmfuZNNJZKhvotMKKlyb+OTPrZCq2E
	sHXlS04yQpQcpoYwO+lxzs1n3jp3/RhdltFOjDYBH1+33G8na/HDhfqWkQ83l0QpVBk8
	SplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WSbS0kb9rVkK4b55a8VcE5jDbDYepaBGCiNjbFDrfj8=;
	b=s7qV/K9W1QaWwGwPKCFSYTCK86xE5a0c15ymmULknPBrBIRqGHbqLW43rzNDw4c31O
	V6wYoh2fLLQRS3Jjg09AduU3S6rewFb4P0EBPbJD5i6g8u6k+xNZCfS/zuFF1QB9hYCk
	8XFPkKva+UaCCVx3cBB09dfxOh7TJv8Vfxxj2Isx2wqb69BGz8BHdT2Cg+ECeqS2W+WL
	85x0JZbJ6Lqj/jFhHB2kBZN/YjSlSn8ekpG3SoQSNvemfsWBZXTWU6qMJwrLbyrHx5jS
	RM57fzRQ+5NVJWHP4tqF/PpyszEH0b84D2C2v/BMOuQ99Wg5LOvEq1dRlAxYle0RrHxq
	WqrQ==
X-Gm-Message-State: AN3rC/7r5wuDBUeRa+xPMQQ8ABBG/3fFslOwu85Ih+nxUkMO7t11gc0d
	gFmkeD1SPoC6aFJjC8K1zoAxiMPr5Q==
X-Received: by 10.80.176.198 with SMTP id j64mr6185367edd.168.1494052511006;
	Fri, 05 May 2017 23:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Fri, 5 May 2017 23:35:10 -0700 (PDT)
In-Reply-To: <e827e9a5-cbee-5eea-33a5-0e32ef3ac111@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
	<CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
	<e827e9a5-cbee-5eea-33a5-0e32ef3ac111@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 6 May 2017 08:35:10 +0200
Message-ID: <CA+chaQejDNmqcrMhy=pq4rvW8+DferSuADwLF_EUQb5MTybjfg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Sat, 06 May 2017 06:35:11 -0000
Content-Type: text/plain; charset=UTF-8

>> If there are more people willing to step-up and maintain some layers
>> or whole meta-oe for master branch, then I would be happy to share it.
> meta-oe as in the mega layer meta-openembedded or sub-layer
> meta-openembedded/meta-oe ?

It was meant as:

some layers (in meta-openembedded repository or meta-qt5) or whole
meta-openembedded repository for master branch.

Cheers,

On Sat, May 6, 2017 at 12:52 AM, akuster808 <akuster808@gmail.com> wrote:

> On 5/4/17 7:02 AM, Martin Jansa wrote:
> > As always, thanks armin!
> You are welcome.
>
> I believe we all owe you a big thanks for level of care taking you have
> been providing on the entire meta-openembedded mega layer.
>
> "Thanks Martin"
>
> >
> > If there are more people willing to step-up and maintain some layers
> > or whole meta-oe for master branch, then I would be happy to share it.
> meta-oe as in the mega layer meta-openembedded or sub-layer
> meta-openembedded/meta-oe ?
>
> - Armin
> >
> > Any kind of help counts: reviewing changes on ML, sending consolidated
> > pull-requests for layers or recipes you care about or just generally
> > helping to fix the issues detected and reported in world builds.
> >
> > Cheers,
> >
> > On Wed, Apr 26, 2017 at 10:24 PM, akuster808 <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     On 4/26/17 11:44 AM, Martin Jansa wrote:
> >     > Hello,
> >     >
> >     > as every 6 months I'm looking for some volunteer(s) to step-up and
> >     > maintain "pyro" release branch.
> >     put me down. I will be sending patches shortly.
> >     -armin
> >     >
> >     > You can sign-up by replying to this thread and then one of you
> >     need to
> >     > send README update like this:
> >     >
> >     https://github.com/openembedded/meta-openembedded/commit/
> 3082e30da58df0711182cf114c71a8c6a093aeae
> >     <https://github.com/openembedded/meta-openembedded/commit/
> 3082e30da58df0711182cf114c71a8c6a093aeae>
> >     >
> >     > More details in thread searching for daisy maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-April/095601.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2014-April/095601.html>
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-May/095694.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2014-May/095694.html>
> >     > or dizzy maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-October/098441.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2014-October/098441.html>
> >     > or fido maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2015-March/100901.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2015-March/100901.html>
> >     > or jethro maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2015-October/103810.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2015-October/103810.html>
> >     > or krogoth maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-April/106952.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2016-April/106952.html>
> >     > or morty maintainer:
> >     >
> >     http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-October/109452.html
> >     <http://lists.openembedded.org/pipermail/openembedded-
> devel/2016-October/109452.html>
> >     >
> >     > Regards,
> >     >
> >     >
> >
> >
>
>

