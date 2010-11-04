Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PE6UM-0006AT-1z
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 21:32:50 +0100
Received: by wya21 with SMTP id 21so2350236wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=s6lr4DDtysS4NslydrMGqDIRzY9jeMPcy/RRpo7hiNE=;
	b=WGu12gqiVvSrXUgpDlo3Os8peiBMwG50GZS023o4tcdKTY9SNY3zdLCPJZXf3mGMww
	yZllklabWU4BaWs+ZJVFgqy6iGPsz5FQwBsgTHvx35bIFhXK6v1C7oDAwPo/Vk4NYOnG
	mcCDPoYHeNLJRnmZ78p5rV9y4CABrbKVjNDEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=SiEoskJI5dtFOzYTxMFBEGj/P0CJIncBVRWWpW2x9m+7soDzYHuXmij9ZSQFMKA/bV
	kZXDq9SN+QSrf/4QGJujYjjKBh2t27dNcxY534SbRxVM0mrdIcIv+E0IMSYILkNNGbIo
	940h/yM/Sa2ABMj06qynCXh6sFOo+6cRFtNN0=
Received: by 10.227.24.139 with SMTP id v11mr1202306wbb.100.1288902717027;
	Thu, 04 Nov 2010 13:31:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.139 with HTTP; Thu, 4 Nov 2010 13:31:36 -0700 (PDT)
In-Reply-To: <1288898080-19417-1-git-send-email-raj.khem@gmail.com>
References: <1288898080-19417-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 4 Nov 2010 13:31:36 -0700
X-Google-Sender-Auth: _fh4TL-8b7a58eOBKTK6Z7UCLvs
Message-ID: <AANLkTint2RuxEiYUOqns7nF=G=iB1_vjPWo9R0OBxvTv@mail.gmail.com>
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
Subject: Re: [PATCH] meta.bbclass: Exclude meta recipes from world builds
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
X-List-Received-Date: Thu, 04 Nov 2010 20:32:50 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 4, 2010 at 12:14 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

