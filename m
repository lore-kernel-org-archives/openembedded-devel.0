Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCB46A941
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 10:15:49 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id z107so8030707qgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Sep 2014 03:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B4PGNGDaVc0RwqELZvSQ1pY5aj30Nzs7CsXfVs5tHcE=;
	b=O13IKFlGxc7LTGww0115I/Y02Trwbkckit0w9gVR2Agt8UpySdLbH0/RCzb1oEGFLa
	n8UUxPAFZX3bRYGUMks0b+uiuGTxO3qx1UFCWppirsxplbDh5ojkrPu8QL5JvGW6nWah
	mho10ZFtky05sCY4F9hpOuKoBL4c9sbFUZVnqFXudLatMBe/TL9GN6RC+1JEQAFHPzYO
	EMo357oePkJcffiSkavD5kBiAaTbCUFGjIdhc54XwOS76wLdjImgtQRLJGZU+XCJari8
	V59Zsc3zq5aI0/sNBkt3MuEII/xwzwEQemGWwMghHX334d1XbX/6j98eGdzLWCf326is
	zNJw==
X-Gm-Message-State: ALoCoQlsdg1pbuDJ7PZf+lFeZLVnB9mec4a/tmvBeYIv84eqMnS9ZiDaTkq5WiuLmfMMZqhZSRai
X-Received: by 10.140.94.234 with SMTP id g97mr5105331qge.77.1409739351119;
	Wed, 03 Sep 2014 03:15:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Wed, 3 Sep 2014 03:15:31 -0700 (PDT)
In-Reply-To: <54067424.8050600@windriver.com>
References: <20140902135015.93AF7504BC@opal.openembedded.org>
	<54067424.8050600@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Sep 2014 11:15:31 +0100
Message-ID: <CAJTo0Lbb8uWBKYUTrqvbuo0VEQm=g3uRMv1KPOPi1YNrYL619w@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [oe-commits] Richard Purdie : package_rpm: Add custom extension support for spec generation.
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
X-List-Received-Date: Wed, 03 Sep 2014 10:16:00 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2014 02:51, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Exception: NameError: global name 'package_rpm_extra_pkgdata' is not defined

If you set the variable you also need to provide the function.

Ross

