Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id E8C2460CFC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 10:43:44 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id z6so4644649yhz.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=qJj82ZawmM4z0MFtNpsKZWcWr6TSSdwCa2G+s+4t+5M=;
	b=roFJO14Te+8PnXmBaaELKyaPc/+ZLHssv6Bdya9O/0+IOrCaKVflbGNm70u39JHjTL
	C1cEqu2iI90ie1q+mjv0Byp5LRTpwOfvXTczCSmLd3F3gMdLoFGs5WaXLSvHJ3ev71MC
	YC83ASr3CAQJSChtsQW5gZJg28ycXCXUghOrQEMWsu2MlcGt+95skVZTZCxwqanLRCYd
	I5xU2w5IY7aweQwkz7CTprHd4TOJTUHPx7TREQULELM1BUfR0hLGc096X3dYJymmwi0k
	ougWnsI+EugXIO6GCOnGSoAwE9kMjWJCgTdFH+dd9IqeyCjndQJJi5m6HGkMUW1qxPEx
	CoOw==
MIME-Version: 1.0
X-Received: by 10.236.15.9 with SMTP id e9mr40080389yhe.37.1417430625510; Mon,
	01 Dec 2014 02:43:45 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.142.132 with HTTP; Mon, 1 Dec 2014 02:43:45 -0800 (PST)
In-Reply-To: <1859515.Hd60QW1tn7@peggleto-mobl5.ger.corp.intel.com>
References: <1859515.Hd60QW1tn7@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 1 Dec 2014 08:43:45 -0200
X-Google-Sender-Auth: oCdvlaynt2xPavn6WxaYC4gLKWY
Message-ID: <CAP9ODKq=OThfe-EO3Xfh0HXSmFyF9M-7OSyqVx6mMGUNZy76+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: meta-java layer maintainership - help wanted
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
X-List-Received-Date: Mon, 01 Dec 2014 10:43:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 1, 2014 at 8:16 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Henning would like some folks to help him maintain the meta-java layer, which
> contains OpenJDK and other open source Java-related components.
>
> An ideal candidate maintainer would:
>  * Have an interest in maintaining the Java-related recipes in the layer
>  * Be willing to review and merge patches from the community
>
> If you'd like to help out here (and responsibility can be shared by more than
> one person, it doesn't just have to be one) then please reply here or in
> private and I'll arrange for you to get access to the repository.

We offered help at O.S. Systems already (even to host a build job for
test purposes), so I am offering help again :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

