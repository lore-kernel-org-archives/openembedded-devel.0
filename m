Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PNeNd-0006ie-Kd
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 05:33:22 +0100
Received: by wwi17 with SMTP id 17so1062428wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 20:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Rap+aaFHk1sGNgEW3xWpGnup2LV5TyhOraz6rO5lt0M=;
	b=X77pNhc1ViDfll8ie4HQIJ13NP07qfRkHgSdiebaygzVH7QSK3iYQKw+hzJWHOrLK5
	xMPPS/oJ1fmNQS+a4b+lmEmNCdb0kLjHHcTHjV2mQ/TQiI8TmGs6zn4VONMMYwgJIQGh
	QD6YmhimSnQFnzoyfsopPUuhlKB+uWwpeiXBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=v6BMJ/jdQfTM8YlP3qMDeD0QO7PbCwMZ/z7/wGfyJBwMZtYAVg6Kmyw5V6hc7FdMsM
	Pr5jzWqAeiJWdbX8q31Ab/1U99xiPd2Gm2AQeTWK/X3JxaiCb73/KDoA48rwqanQKXS5
	7KdOhTZyU5wYsWwCizT83I9o5AHyA5S8dITCI=
Received: by 10.216.59.193 with SMTP id s43mr1465509wec.42.1291177920375; Tue,
	30 Nov 2010 20:32:00 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Tue, 30 Nov 2010 20:31:40 -0800 (PST)
In-Reply-To: <4CF5BC8F.7060704@gmail.com>
References: <4CF5BC8F.7060704@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 30 Nov 2010 21:31:40 -0700
X-Google-Sender-Auth: xGfduS_TvwWRS1w_FWRRvEP2LfY
Message-ID: <AANLkTimQ-CZDyqU_UGdf1qh2Bv-zLuWiOuEqUnY3-V5o@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] debianutils.inc: Fix do_install for DISTRO=micro.
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
X-List-Received-Date: Wed, 01 Dec 2010 04:33:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 30, 2010 at 8:10 PM, Graham Gower <graham.gower@gmail.com> wrote:
> mv: `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/debianutils-2.30-r2/image/bin/run-parts.debianutils' and `/mnt/oe/tmp/work/mipsel-oe-linux-uclibc/debianutils-2.30-r2/image/bin/run-parts.debianutils' are the same file
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>

Acked-by: Chris Larson <chris_larson@mentor.com>

-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


