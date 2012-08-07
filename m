Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SyZsp-0007jG-Ty
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 04:50:59 +0200
Received: by eekb57 with SMTP id b57so1072079eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 19:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lM9gjgTJlVFYZ87ynxqXXKfF2dvc/QDzB00v+MJvea4=;
	b=ePBF1V8N3i6eRB49bWNOMc07hPMbGVVopbAdOaRgQf28FF62X9C3rAXOenQIeufysi
	omfyGCjTGARvOswcOe/AHOX0irPdIxFIp0cxB0ZSdjMaTPTgbMc3r6KblISd0yIZvcGh
	XznkVuMfH/0nNiSyOuKn7yMPg/9oyc9yH2xnS1Eo93GpVrLIpj/xbgtAiYaGlE6T2/9i
	VotwblJNfX6H+dNh6BoLsEFHtvB85Xybz7nowMkMegKxeWF7qdLZAbiw9cVpw8MAF7NU
	0+MU3BNVeI0RZJFf6bgkvd+ahQaVkOiOw9OQLymBALr+/qhfQuReJbo1URZBJ7H4slHa
	AvgQ==
Received: by 10.14.213.137 with SMTP id a9mr15669490eep.38.1344307154684; Mon,
	06 Aug 2012 19:39:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Mon, 6 Aug 2012 19:38:44 -0700 (PDT)
In-Reply-To: <jvnsim$5e9$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jvk13l$nh$2@dough.gmane.org>
	<CAMKF1sqBGOR=f-e+D8zrguifFbsRzkVLtLsOCf4rxaGKiwPK2Q@mail.gmail.com>
	<jvlm56$r75$1@dough.gmane.org>
	<CABcZANnEmASgH3wrk7TZOpe3BaK+o6oRPyvAo6SadtybgqDWJg@mail.gmail.com>
	<jvnsim$5e9$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2012 19:38:44 -0700
Message-ID: <CAMKF1spB+9Y4HpzYrYag-UCAcBw2TTEKz34vvstJd_7f1bV_ng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Tue, 07 Aug 2012 02:51:00 -0000
Content-Type: text/plain; charset=UTF-8

Koen,

Besides this patch are rest of patches acceptable?
while I work on making blacklist class acceptable in all use case

On Mon, Aug 6, 2012 at 12:43 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> updating of all layers by the submitter. On the other hand: if


