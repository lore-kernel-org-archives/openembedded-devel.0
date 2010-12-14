Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PSKe0-0004JT-OG
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Dec 2010 03:29:36 +0100
Received: by wwi17 with SMTP id 17so111707wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Dec 2010 18:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=aqPXpVSHI5oik+gssG0UI4m/RKPKdTrs9/5+rTT/tbY=;
	b=vpETHjmy10VvruMKT6vaPLpe4KaCC+f5Tj+uJGGZ/knNBCVS3KGqYgo46uiumpgEdc
	4cGGL5bTHg3zj7ChzAD03zbX2gy57y9M7BxXTFAvNUN7uDRhPv+PxEuJSy0DyfpzowQG
	LFMHj9+xpLe1+tGkYTouoEwXjUCdZib+gihUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=g//C2vFJRZfCUmMIs6afOa92HPsMo8jgovRMR1LC6l03sgqDRyzb4uISVwahiup75r
	ePJP6R+mi3gBfwP9NXcfQQG/c6cFMntqZ5+2/ZqFpiOQhT4HT3IYneMvY4NXCQBioSCL
	ONykKzBNdBFAhnCe3Z4MjxVWmuhtYWMolCs+Y=
Received: by 10.216.220.219 with SMTP id o69mr2189518wep.57.1292293680706;
	Mon, 13 Dec 2010 18:28:00 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Mon, 13 Dec 2010 18:27:40 -0800 (PST)
In-Reply-To: <1292282461-13310-1-git-send-email-robert@erafx.com>
References: <1292282461-13310-1-git-send-email-robert@erafx.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 13 Dec 2010 19:27:40 -0700
X-Google-Sender-Auth: 19wXysQsqQ0b-gcm_0oKHL4YQ-o
Message-ID: <AANLkTikj4knk7sH5w0PckcAu63HB1dEqmzKok7yZqvku@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: Get rid of "WARNING: Function do_build doesn't exist"
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
X-List-Received-Date: Tue, 14 Dec 2010 02:29:37 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 13, 2010 at 4:21 PM, Bob Foerster <robert@erafx.com> wrote:
> Signed-off-by: Bob Foerster <robert@erafx.com>

Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


