Received: from mail-vc0-f170.google.com ([209.85.220.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URl2s-0005tr-OL
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 17:10:31 +0200
Received: by mail-vc0-f170.google.com with SMTP id lf10so4049413vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 07:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=7pQTf0qfHRaD2JyVvoQ2xnztBjLXWH03uAaDjaLQ84U=;
	b=KVDc5vuZ0scD//9GLZ8u7kqMvirU/4IY0dHoz3nrXWEW+K23fSq0hRITLZcOv91Urx
	biXx6Nk10+BZnEyH3srRwfnAhwW2hIQ7/mblz8vVMRemBwCnPTdNOOeUGmtM3UW+2PJN
	/BcCdB6zQ5V2xrwJ1UigzIwwyVRIe71e+aGmnANdyRZeAEBXwqWvMslYOWZz/tBjGcIX
	fCgQ058jxl14qY2aic5t7tQGk8HBhZuf0OP8GGRRLoq0Wr56o2YqbhqF/v2eWIlUdj5G
	hKq349apc1StKAipL3Xc41KtdHM23TghYEzmtTFRG6MhqUFJtm3rAtnrQJp0f6xioZe0
	l25g==
X-Received: by 10.52.23.115 with SMTP id l19mr14021393vdf.55.1366037565455;
	Mon, 15 Apr 2013 07:52:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 07:52:24 -0700 (PDT)
In-Reply-To: <kkh3q2$gl0$1@ger.gmane.org>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<kkh3q2$gl0$1@ger.gmane.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 15:52:24 +0100
Message-ID: <CAJTo0LY7XoYcC9F0N2qCPzQRF6-VPkR+MZUDvfMP=NNUp9a6LA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlyG7byUZsENdQiLW0bhif/0YzfRtXxwhTey0KcwMGRw+HlLlYy6VxdoigX0m8R8M/HrgBl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 15 Apr 2013 15:10:49 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 15:45, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Speaking of GNOME, I noticed that I have to manually (re)run postinst for
> gconf schemas after first boot to get the apps to work. Is anyone seeing the
> same?

Urgh.  No.  There was recent changes (breakage/fixage) to the postinst
stuff, are you totally up to date?

Ross


