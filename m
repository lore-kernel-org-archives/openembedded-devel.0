Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 589237057E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 20:36:20 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id c1so6077248igq.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 13:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FCfvKfGUb2ZjY1KzWIH8tKT1qbJwGpjHtRck48HRfdc=;
	b=m39ebZBryMecqETp0V9CBMvzbjhMn+rr8IGixHkJRrsFr550votsbRTlLRBuxCR57I
	yd7+IDihaTWBHA1ALo1EBfb3o2+znf+9nAFS4jDL4oT/jlc5ePgm2WkXeoLO+Kl4ZzIT
	/yBhMQ4EX1d0100gdgnuH28SuWOWew+3WcwOAVv1TauFsO/nMlsaVA4Xs5behStNCSRu
	v8AGT7LSEmZOykR0iQCaEMB9ZRFcx64l5Ocl4QLTcN4+I6mkWEZWPFzadB3kMQOLEVHc
	KFOHaPWHnuYmfgkDJcq5bfxsIbFb0M/7V4gs2CgBylpWtYsPRT6nId0bTZbEZOoAzINP
	UShA==
X-Received: by 10.50.134.136 with SMTP id pk8mr47424124igb.20.1406666181506;
	Tue, 29 Jul 2014 13:36:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Tue, 29 Jul 2014 13:35:51 -0700 (PDT)
In-Reply-To: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2014 13:35:51 -0700
Message-ID: <CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Tue, 29 Jul 2014 20:36:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 29, 2014 at 3:22 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> +Upstream-Status: Inappropriate [other]
> +The info bar is not a bug; it is just undesirable in some use cases.
> +A clean approach - which requires discussion with upstream - is to
> +disable it by using a command line option.
> +
> +Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

I think it would be better to get a suggested solution which is
acceptable upstream.

