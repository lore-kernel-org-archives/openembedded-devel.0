Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 21F626017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 23:38:30 +0000 (UTC)
Received: by iggp10 with SMTP id p10so55942345igg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=AJpB981pG/VB0UlmGTiyNNZ6l2FbbfWaKy67vGl2JYo=;
	b=a+RD91hWEkheb9NxVIMcjuSEB4znKmhz4fUU8XY2FwLkBhjYb+xMuG7BPDSk6ZsAoH
	c6cVTRe2QxyZEGMjG1I8y/wwozXT53QV1Q9qw9iQYMw75AuLK0FfLwvMNbZELRn2S6UN
	Rl9pRoybsWAOQQp5qB8I6JYtBq8Q3JlAR7BJuNjQk8fsi4uZulu2d2cFjNFFWOJaE//R
	wNjVESau/2kHGwns9nuc5qeXuLvgVoI4glbAKQXS5Ip5AGTDocRAw/h84Gd48t5a7Ko+
	/4UHv6KUuj6u12y6Az0CuhL9IsG8YFnrGxX7CsNEvhjJN6LKgUMBMaqlF2PniFfHvjKg
	Vjdw==
X-Received: by 10.107.4.6 with SMTP id 6mr14470323ioe.49.1436657910764; Sat,
	11 Jul 2015 16:38:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sat, 11 Jul 2015 16:38:01 -0700 (PDT)
In-Reply-To: <559DDDE2.6060801@windriver.com>
References: <1436234152-4937-1-git-send-email-rongqing.li@windriver.com>
	<mnfurd$pvc$1@ger.gmane.org> <559B8063.7010906@windriver.com>
	<mnir45$f4q$1@ger.gmane.org> <559DDDE2.6060801@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jul 2015 16:38:01 -0700
Message-ID: <CAMKF1srKu0-TZEy_aNa_X2S-ehJhLJ3i+FKz1KeUwoZ=jP4eKw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-networking][v2] znc: upgrade to 1.6.0
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
X-List-Received-Date: Sat, 11 Jul 2015 23:38:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 8, 2015 at 7:35 PM, Rongqing Li <rongqing.li@windriver.com> wrote:
> it is better if you can revised this patch, and submit.

generally, when a patch is proposed then its reviewed if you are lucky
if you get folks commenting on it and giving honest feedback
and its better to address that as an owner of the patch and send a
revised version. Reluctance in addressing comments from reviewers
might end up in patch being discarded

