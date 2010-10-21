Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P92Eq-0006wt-5b
	for Openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 23:00:00 +0200
Received: by gwaa11 with SMTP id a11so418942gwa.6
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 13:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=bwlxw5AQKXau2bYXb1+yiRN+PNd5u2weLro8PltCTU0=;
	b=PhYamYSWd5FiMdmKeeBlWrMiRQ5BYAUzYmRam0Rkg7zGuryvbWcNM76TLYVBebUK1F
	VYct8b05SSCq4PDaGpcRTPA9np+RFX8bJOjwvE4IFnqXDXy/wgCuDkBq157dcQGkafvx
	shbJPw/EVXtUxtSrZuyYZpIHBQOUp7qDO6FbQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=rZLtdyNCjRh1csuLzJKLgU1bxrANq/j55C0RIk/+o7QKTz4dg89qWWJ2qmFgkeNRBN
	Lwt022/AWfBlGGGECo5ldkh5ZCa/bQ++XvPwAEtlWXFOqUJDGiSGqYvKtxlEbeW7PVPY
	puTdXxL9cZQthnr+SRgco1fbu54Lb8/WhinV8=
Received: by 10.90.98.9 with SMTP id v9mr1651346agb.53.1287694744684; Thu, 21
	Oct 2010 13:59:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Thu, 21 Oct 2010 13:58:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Oct 2010 13:58:44 -0700
Message-ID: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: patchwork cleanup call
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
X-List-Received-Date: Thu, 21 Oct 2010 21:00:00 -0000
Content-Type: text/plain; charset=UTF-8

Hello OE'ers

We have accumulated quite a bit of mails in patchwork. Patches that
are send to OE ml are nicely captured by
patchwork and shown when one visits http://patchwork.openembedded.org

It would be nice if committers,reviewers and authors update the patch
status when they deal with the patch

So please spare few minutes and have a look at the patchlist and see
if there is a patch authored or committed by you and update the status
accordingly.

I regularly use this tool to pick up patches and this exercise will
help to remove the stale patch states

Thanks for your time

-Khem


