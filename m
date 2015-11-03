Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id B2D1873D46
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 16:16:05 +0000 (UTC)
Received: by iodd200 with SMTP id d200so23811366iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 08:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iI2VJBgrfidu8NciXBO1fQWxrz6vwH7A+d+ClKTmI94=;
	b=iTwZAVWo5b3KUYRLrlleRpdzJ78L2JPfTcf4iztM50pkljG3e+VvMNgfsvlJTc3+1X
	IPJhgo9E492kbaydvzwfW7M1NAHYBXoFTfz5eqS4mDwaM6KTb03bFZaLmahdTOXjZmkh
	iVTAQ1I/DhHIyEy28BT/L0dlO6iWglo6mQdZvpIieAB9ETFZTWeoUPwu+1x5ZqOQur2P
	RNf4fHttP+vl/z50LquAGIPc4oPahkYWMRzI7dJsxrLZztgf5LSQoDrHGzYt5gERBRiS
	c3DFKQU44O3kB8fp9lAh6bjBclJNBmj1Fe572locPuTwGetS+eVMfIiXKywfIYw720ni
	La9Q==
X-Received: by 10.107.4.3 with SMTP id 3mr10541703ioe.195.1446567366238; Tue,
	03 Nov 2015 08:16:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Tue, 3 Nov 2015 08:15:36 -0800 (PST)
In-Reply-To: <1446541344-186769-1-git-send-email-wenzong.fan@windriver.com>
References: <1446541344-186769-1-git-send-email-wenzong.fan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Nov 2015 08:15:36 -0800
Message-ID: <CAMKF1so9srmNQoPa3FdXx0QFQmc20dRe=jMOfDUsYa1ddSsUQg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-python] python-pygpgme: add python-pygpgme 0.3
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
X-List-Received-Date: Tue, 03 Nov 2015 16:16:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 3, 2015 at 1:02 AM,  <wenzong.fan@windriver.com> wrote:
> +LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6517bdc8f2416f27ab725d4702f7aac3"

a single line licence ? what does it say, arent there other places
where it states it more clearly.

