Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UeMWN-0007xG-Oh
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 11:36:56 +0200
Received: by mail-vb0-f44.google.com with SMTP id e13so3639835vbg.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 02:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=pLWAewNF9C/vD/GYVsezFiSspmbNRY9VvrKTCSF8dcg=;
	b=aUqnToulkpvY6sPSOm81sxQF93s7kcn5xhr/sSVSXxC/5WtMwj9uPl3cepirGDvtGN
	WI6sD2L1zQwgVgvgEglpJcYzBTYwTjs6e7AEc8K7OAF+rJ3CO4NkBFdh08Zi3ZBSsdAY
	L3N5l0y8jGtuKizk6lDMrJCDgz5Z5oJB5btrXMIp3iOu4Dhgfth7kF1848LhJaOoSAjp
	gsROHq00HbzJpwMmBOFfsW9954UuozPoa8ECdowZmaQ6aajQMRD9DvpBiu8CTZ6kRDLE
	N8l1yPd2TV6fUwlHFsivTjaZo2hatvfT5oJBARKkv0TwCtMK+10aDQqJ0YQRpMI47G44
	brZQ==
X-Received: by 10.52.117.212 with SMTP id kg20mr29026795vdb.55.1369041507367; 
	Mon, 20 May 2013 02:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 20 May 2013 02:18:07 -0700 (PDT)
In-Reply-To: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 May 2013 10:18:07 +0100
Message-ID: <CAJTo0LYDp-wfrSqkswLdj32keLtyV62oCZm5cuX4QXtUGyEG1A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmesxMPKVXGQ327+fsYzwb+6zmqPsKJYl6BhafxefJd8j4w6iRrDTwPtkxtm9CySGdJemA9
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 09:37:15 -0000
Content-Type: text/plain; charset=UTF-8

On 18 May 2013 17:39, Khem Raj <raj.khem@gmail.com> wrote:
> +BBCLASSEXTEND += "native"

Why don't you submit a patch to oe-core's libxi, or even
xorg-lib-common.inc, to add this?

Ross


