Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <takeshi.ken.hamasaki@gmail.com>) id 1UMcf5-0000Y8-Re
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 13:12:27 +0200
Received: by mail-bk0-f44.google.com with SMTP id jk13so856179bkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2013 03:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=c8WUqVaTlq840xPsSjsO3+NFgu8FMeRYZlkzs+MPOr4=;
	b=PsXx3WYrGVn+/0dWgZ9oXiAAdh4O6wHRi8OtqOFVegq60nBavcN4AySeklylN640zy
	x4T2gL8Cn73ki4o1tzKjSyEaFP8S3I8nwgWgrNWAJw8CbpxF+9XzqOPh5RTXXqsjjWBt
	+fEQAU1qcrnPJzIy2oPfEbLF2nFSffde3PeNkx8D1fbjRyGWjbVpAuZd/2YPbiS2Far4
	YNrXOnDVoriKqPoUjGRd6UNGg0jUED4dh+SOARmKJgUc924w0ZhA/gF1oRkxjgIAgYkh
	B/zFe1YnsmBd6KSingVGceLleDz7WzuZo6BA4ePD1URvipOIUjeqj2ziN6s242Ea7YGu
	oUpg==
X-Received: by 10.204.145.11 with SMTP id b11mr4870231bkv.65.1364813719400;
	Mon, 01 Apr 2013 03:55:19 -0700 (PDT)
MIME-Version: 1.0
Sender: takeshi.ken.hamasaki@gmail.com
Received: by 10.204.25.141 with HTTP; Mon, 1 Apr 2013 03:54:58 -0700 (PDT)
In-Reply-To: <20130331072539.GO11120@jama>
References: <1364700773-32662-1-git-send-email-hmatrjp@users.sourceforge.jp>
	<20130331072539.GO11120@jama>
From: Takeshi Hamasaki <hmatrjp@users.sourceforge.jp>
Date: Mon, 1 Apr 2013 19:54:58 +0900
X-Google-Sender-Auth: YhHkgWa9gFrUOL_a-GNeQb_a0a8
Message-ID: <CAPESJy7_=C-h_os7S9MHV3Md78_hXFcVNEy8CA4pV=HTScFo=A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core][PATCH] pcmciautils: Correct definition of PCMCIAUTILS_VERSION to avoid segmentation fault
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
X-List-Received-Date: Mon, 01 Apr 2013 11:12:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/3/31 Martin Jansa <martin.jansa@gmail.com>:
> oe-core patches need to go to
> openembedded-core@lists.openembedded.org
>
> please resend

I subscribed the list and sent it there.
Thanks,
-- 
Takeshi Hamasaki


