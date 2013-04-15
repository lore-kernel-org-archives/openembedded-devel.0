Received: from mail-ve0-f180.google.com ([209.85.128.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URlZt-00017B-NX
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 17:44:35 +0200
Received: by mail-ve0-f180.google.com with SMTP id pb11so589603veb.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=0B3Q4oq8kqVUMDJ5j7VY1VC6t0SHGg4lvdFJKAKXQ7I=;
	b=fu1oNXnndJRx8Zi6KjaizggDbbYEL5WibvtB/tjSFh7K3dpqQ2JHjFLeXIHmI3SNrX
	MftNPyKPJTuy4mzBuW2MaNCl2OQW+6UnBD5RVAcQA4n230IYL2Cthrb41TXUHeGNXgHm
	kLRVRyljQO8qZCA7KJJfWMv3nSqXX1Pk8x336pZpUANDrIuAYEM4M7QmBvcZRkBR52DF
	Qagfy7TwmqKfSB8eWif9NlJ1HvxyedGRly+KkPjxj4mUHYasuRm1jr+o7UUbZ/Sl2pdi
	Ae0zClWLa6qo0IyMDmgKsr5rPLHRneyUqJlhB1jSK6aAbMwJJWvxZ/I/new5u7NCoD5z
	7ebw==
X-Received: by 10.52.73.234 with SMTP id o10mr14082737vdv.29.1366039612366;
	Mon, 15 Apr 2013 08:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:26:32 -0700 (PDT)
In-Reply-To: <695A7205-3EAB-4CEC-82E3-3455F19D0024@dominion.thruhere.net>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
	<CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
	<695A7205-3EAB-4CEC-82E3-3455F19D0024@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:26:32 +0100
Message-ID: <CAJTo0LZSUZMf1xKP_mQAfspaAd_HKUCeQDJ5K8Ayrr1-28YcVg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlHxrl35R4tPe4hmGAEi7xmYr50ELJTcCaVXCKQ7/te/Uo+itACNA+YOi4b3T/36jb69r80
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:44:39 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 16:13, Koen Kooi <koen@dominion.thruhere.net> wrote:
> that doesn't seem to have postinst fixed for opkg based systems.

Possible that there's another bug still out there - does anything run
on first boot?  The gconf stuff should have happened on the host so
this is a bit worrying.

Ross


