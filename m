Return-Path: <raj.khem@gmail.com>
X-Greylist: delayed 3305 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 May 2014 17:15:36 UTC
Received: from mail-ig0-f171.google.com (unknown [209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E57DD60173
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 17:15:36 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id c1so2312670igq.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2014 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wBtxOwxVZ7CWAoszhJm3cU3sMkS9BB3ibIWvdiluchk=;
	b=pZiJKX/5p9tLNltfb1FsFe55RG7TnsmJmwo3uIWQxv5QCqOdCgxcbKO68wGh/76vns
	Y9Nzn3X6jwtDvAePsWm5QsrsSCokvPxS1dK2N/fkihzv39dh7oqMJPwoqwYJFnJA6jJo
	97k99iDdXV9l/5o/h1s7Oa/h3Ec7KAgsfMhlie3Pc39N+2BNTshBAUDi9bOyC4kRVilM
	Wlqf/36+Iw7OWRGe89o4DSfs0vRadOksinwKZkRb1Ylc1xAcDOfJ6hoHE3Y1K09fIOaA
	rG1Sxk02iCYAR/6XWD5H0w/GK+m/tNSDrwcjrufgf0zSnC2u98gPPa5LnBAxTsqyR+96
	qq9Q==
X-Received: by 10.50.83.6 with SMTP id m6mr23629995igy.30.1399742137474; Sat,
	10 May 2014 10:15:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sat, 10 May 2014 10:15:07 -0700 (PDT)
In-Reply-To: <1399484702-22433-1-git-send-email-ticotimo@gmail.com>
References: <1399484702-22433-1-git-send-email-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2014 10:15:07 -0700
Message-ID: <CAMKF1so8ws==4eFv5C7n_OR_WeSYcWSK86nXuYj5yrKu+-bfXg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][WIP][PATCH v2] fluidsynth: upgrade to 1.1.6
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
X-List-Received-Date: Sat, 10 May 2014 17:15:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 10:45 AM, Tim Orling <ticotimo@gmail.com> wrote:
> -LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"

what changed here ?

