Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1Ow8cq-0003Nu-4z
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 09:11:22 +0200
Received: by eyb7 with SMTP id 7so486801eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Fe/qRj5ViO5Ybw1wi1V9Jy/Z6nrFmZ8iQYcJljFNkvI=;
	b=Opcrj+SO8i3wmNeMKMqUT8J63lKeHnbl9TqWW7c0mEDgmYeQj/rcOpPt5I3imcYrCS
	IdqOil93VjxqaUgwUCg++BXpN/qBNzijjAMvlEwveRwewT6ncEI0vwhjPyv/GhBXdFEM
	CxSSpyEWTW69iXEhX4UCfPvSSNsNJxuDZFKK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ozQnedHYt+qh1AwrjCKAgZ4eUDUs0Ai2KTIliLLF4kleWM473EdOsQMV5h2MqDZvgM
	Y7pwj2asPi5bKYrPqqfUZSGS25n8ETb258c2nDtCYs69jNJS0bmSmbZsMYYGPIRZ01G+
	OZLSvhBLVq5kwfXHrJtUbWdDs/0rlfIjcjLf4=
MIME-Version: 1.0
Received: by 10.213.33.13 with SMTP id f13mr2343025ebd.49.1284621032079; Thu,
	16 Sep 2010 00:10:32 -0700 (PDT)
Received: by 10.14.122.139 with HTTP; Thu, 16 Sep 2010 00:10:32 -0700 (PDT)
In-Reply-To: <AANLkTikhFQU3OGHQXW7JpgzDP_CLofDNjdwfByQyptbZ@mail.gmail.com>
References: <AANLkTikhFQU3OGHQXW7JpgzDP_CLofDNjdwfByQyptbZ@mail.gmail.com>
Date: Thu, 16 Sep 2010 13:10:32 +0600
Message-ID: <AANLkTinVdEhYeKdVv4DG_1gmo2pMRCPWsydG9mPmDZdV@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: upstart: unsatisfied recommendation for libupstart0
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
X-List-Received-Date: Thu, 16 Sep 2010 07:11:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 16, 2010 at 02:14, AJ ONeal <coolaj86@gmail.com> wrote:

> opkg install upstart upstart-sysvcompat
>
> opkg install upstart upstart-sysvcompat libupstart


> unsatisfied recommendation for libupstart0
>

This library included in libupstart package.

