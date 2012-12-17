Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tkbn5-0001uP-Fi
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 15:35:35 +0100
Received: from mail-qa0-f69.google.com ([209.85.216.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 06:20:02 -0800
Received: by mail-qa0-f69.google.com with SMTP id o19so5442680qap.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 06:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=laqaK3fnQncspJ9kNEQNpOLkTbk+J4CYLqO65ciCKVA=;
	b=pOgFy/RI/KtUodq3suWAMfGGcXaIu+V7/VAIF/9AxkNT+DnJCe3r4gzMbI9RyWV/4a
	Yt5ecIAqUopubPYIaVL6oZ9hd8FFsjAqxR8XfD4Jj3JScikH2VnE/HWgQWTB2DT0VXMK
	xhkQmUBDnEJNoqvBi36MGChixk49kOETRScjdno9mIhEEyeYb+Vh6yS9t8JKh/D7WPR4
	ULFPWyOEMscihzlyKwwgCmnvev4tdKb6//bFfbbwsSlBkkCOgmt/hKViRlysowq78/41
	zbybtx1bVDWIUIX12EGMn9Ys3qqMcHMMB0QujrNHIvs+ieDNKMvezUaXCj+dX3BpMpAP
	NfAA==
Received: by 10.220.115.20 with SMTP id g20mr23533690vcq.31.1355754052786;
	Mon, 17 Dec 2012 06:20:52 -0800 (PST)
Received: by 10.220.115.20 with SMTP id g20mr23533677vcq.31.1355754052688;
	Mon, 17 Dec 2012 06:20:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 06:20:32 -0800 (PST)
In-Reply-To: <kan4oj$786$2@ger.gmane.org>
References: <1355742261-14593-1-git-send-email-ross.burton@intel.com>
	<kan4oj$786$2@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 14:20:32 +0000
Message-ID: <CAJTo0LZWt4DwfF6oJ7uTuk2xJTOi0BsLa6mC_JAKYO7-xhJJ3g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmZs7zlpdLz83nYxBx1m+PNbrrAuBipmrSbt6ATZ5sjPRELAcVYbKOn9XAqSY2cyT5Zl7oyBNB+UjYhazyffqpmy7hfqWYlX72p4TDUDFf5aALkXqKR76AVySDNV1O0AIhiu5+i+OaIgvGhzRNjEOl7y8kP5h4nP9Meagx57OPdnbJnZpZBZ4DvMCZjoFpgXof58jKr
Subject: Re: [PATCH] waffle: new package, a GL deferred resolution library.
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
X-List-Received-Date: Mon, 17 Dec 2012 14:35:35 -0000
Content-Type: text/plain; charset=UTF-8

On 17 December 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> *insert usual comment about PR=r0 being a nuisance*

I still find removing/adding PR lines more annoying than a redundant
r0, but we'll have to agree to disagree.  Alternatively meta-oe
embraces the PR service model as oe-core has, and I can drop them for
good.

Ross


