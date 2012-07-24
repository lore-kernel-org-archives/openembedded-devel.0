Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1StjX6-0006f2-QA
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 20:08:33 +0200
Received: by lags15 with SMTP id s15so1062163lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2012 10:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=xjUZWOPF4LTDAy8isSXbdoRTMFhxEq0+ADYb6T7KTsI=;
	b=P0SX4nHeMdZtHS0G2tBSnrIFBZCOi7wW7IJfHCiglfWLSLtGoyuCeOE01m1tNujtpX
	r015IPWlSMnpaXXkOR6II3fCUnSkSK83LXD5GJ+h9o3TWE3rqSe7HGGhmiyKn1LVRLFf
	c0ZxdvmV50oCEUnopQjO8XfLIdPI3nR4jGgF2k3QPaFtOePNM31FUxVdoLhNpkyiQMQ/
	8oNBrwyzufrU6ppJNyXfaidsQxSVHjAHn703qlZHhFBRyIfvATyKXEL6x3lxy05WpXR+
	7R9rsEfScaqPaFiwKuBU64247u7su9qh3Ebw6vfkXQdUkTLoPTmJwsINOJ4vtCDz81Dr
	87Pw==
Received: by 10.152.148.1 with SMTP id to1mr22430776lab.34.1343152624283; Tue,
	24 Jul 2012 10:57:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.180 with HTTP; Tue, 24 Jul 2012 10:56:44 -0700 (PDT)
In-Reply-To: <1342833151-18755-1-git-send-email-kergoth@gmail.com>
References: <1342833151-18755-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 24 Jul 2012 10:56:44 -0700
X-Google-Sender-Auth: vdyL1sdtEDFmS5LXWq9dMLcVe2c
Message-ID: <CABcZAN=YUgR4GdFyUN5oez3VmApY-o3ev819B9FRL=wTAU4K3A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] nano: add PACKAGECONFIG for 'tiny' build
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
X-List-Received-Date: Tue, 24 Jul 2012 18:08:33 -0000
Content-Type: text/plain; charset=UTF-8

Ignore, resending with proper [meta-oe] prefix

On Fri, Jul 20, 2012 at 6:12 PM, Christopher Larson <kergoth@gmail.com> wrote:


