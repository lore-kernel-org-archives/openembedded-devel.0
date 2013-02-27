Received: from mail-ie0-f181.google.com ([209.85.223.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UAUm4-0008B4-CH
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Feb 2013 01:21:32 +0100
Received: by mail-ie0-f181.google.com with SMTP id 17so5144353iea.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 16:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=5bA3tv6SYHau/XxurpDrtGbQ9cUY3V3xFsmS0IpZg3Q=;
	b=ayWzkdXykKVkOO7DhT0HW/d9xSo2auGwU7l00JbvM0lnTQsSJDAr8dwlsejQGtuTvE
	YhE7DM29WciNKgVQqZEnZ24AAJmtmHL/whwk/8EcTNeBzh/qYBtIEAqI1cLICTJ+6TlE
	UpvqVMR3WFH14/nkvmNqfI+bZcnE8eFDaaPobrgtf+rvOrNpt+X3dZg5vSDk6JPu3QLR
	LFGR5s92We9w5snsvySmWsXsGFZ/kjPtjtNLB8jjM4o94AZOQSGn2qrXPXKqAyx14I8V
	wPwI008JVTPEDGMSxO3wCgHojvJ/4LRW+EAgmAiFT86MP3k+XpRi/tGwdDR1MC75OR/X
	yfUw==
X-Received: by 10.50.56.141 with SMTP id a13mr116710igq.24.1361923512183; Tue,
	26 Feb 2013 16:05:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Tue, 26 Feb 2013 16:04:42 -0800 (PST)
In-Reply-To: <29610694.jSKIIbYMnE@helios>
References: <1361432524-26238-1-git-send-email-raj.khem@gmail.com>
	<10163036.J0OQEGjt9t@helios>
	<CAMKF1spvgucpsYJs9q16_o7Qz5+WeXmgDFFaF_-uJzx_BLbvdQ@mail.gmail.com>
	<29610694.jSKIIbYMnE@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2013 16:04:42 -0800
Message-ID: <CAMKF1sp2OWjoJMDMH6zx8GfG2HEW6s_dPkN8diJ=Q3Q6uwoWtA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie][PATCH] kdepimpi: Fix multiline comments
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
X-List-Received-Date: Wed, 27 Feb 2013 00:21:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 26, 2013 at 4:03 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> Ah, oops... I neglected to push to that repo as well, now I have done so.
> Mirroring is manual for meta-opie / meta-handheld - maybe it shouldn't be.

we have auto updates to meta-oe and other git trees. May be you can
work with Phil to add meta-opie to OE
github mirror as well.


