Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6r1U-0005kP-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:37:05 +0200
Received: by wyb40 with SMTP id 40so1153288wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 13:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=FCBEt+65inCBYBxt/NcvekLqmF/ntZE9FozNtAnztAE=;
	b=WWSr/x+7h/zTGSLMZiApze05Zd3pSxXa2isrdgmTcyAYpQEmUZDZfG5Q9p6FKDxAMz
	azsWzY05jKfWgf2kFOQ8KFpyR8aq5vt7MFCPB0cizDhnyXxxU7JLBRjZNTNHlB9NpRT2
	2nFAsXLhxk5S/f9o7zm2pIWWIbs3t2ZJ4hi4M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=nZQ9HvyOyMrc5gqGAJvmTjXGqUhkfc3tvJChI5BnbF3JT5EQmTn3KaizTRkbx9IYIO
	QPxqZGAyVRMcOGZEN7plZiGI04IwawLZR90vdKlwOL9xCiXUqJEuLNj8is3PXjxFbRcG
	kVzLBZt38gbwjFQPmSqIOAbh9skp0IaPaUd8A=
Received: by 10.216.187.130 with SMTP id y2mr2122842wem.60.1287174984971; Fri,
	15 Oct 2010 13:36:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 13:36:04 -0700 (PDT)
In-Reply-To: <1287165804-5939-1-git-send-email-obi@opendreambox.org>
References: <1287165804-5939-1-git-send-email-obi@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 13:36:04 -0700
X-Google-Sender-Auth: sa-YrV7A0u_kPFImGx2Rroti2tQ
Message-ID: <AANLkTi=NVcuF1rS7=otWPYLeYJFE-ec6kj6Jovnx4xL1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] oestats-client.bbclass: Fix "AttributeError: 'NoneType' object has no attribute 'startswith'" if OESTATS_SERVER is not set
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
X-List-Received-Date: Fri, 15 Oct 2010 20:37:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 15, 2010 at 11:03 AM, Andreas Oberritter
<obi@opendreambox.org>wrote:

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

