Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TfqmN-0003XC-0N
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 12:35:11 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 03:20:47 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so17729428iea.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 03:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lLcd6qIB/hF5bErewGMeGOflpdUY7wLNLjBSbkHNYVY=;
	b=E/tvUODXQKb1HHvUAdwTXR9fKz6f0sWq42F90Cli/0kQ4pQcEtfLej6YEWWIlKXoRi
	m2IMFe+pnRyDWf65hjOjyHJfKlTGTadG6eH9Wt+jdTanykYa0Xh3LCW0btej6IoSDwj5
	ETQuaWjNL3Yc6lhhZVVP8UWk6DxWslq1UOu7FLh+snB7YSMGeOzGzHq3A06KXHLqRsYe
	d3tgaotJEtMC1aNvhvzG88FXP50VabHdTAfWKGpQSfqSj2W0ckzMCPsyhcIZYMGSxlI+
	SlQEhoUh2lha52VMraOq7R5t0pPWvVRoyDx8Z422XBXASec0jOHJG7QumHoXpvZaEaOu
	8UkA==
Received: by 10.182.89.103 with SMTP id bn7mr7436797obb.35.1354620046707;
	Tue, 04 Dec 2012 03:20:46 -0800 (PST)
Received: by 10.182.89.103 with SMTP id bn7mr7436794obb.35.1354620046640; Tue,
	04 Dec 2012 03:20:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 03:20:26 -0800 (PST)
In-Reply-To: <11016715.fxrlBBZh8S@helios>
References: <cover.1353602922.git.paul.eggleton@linux.intel.com>
	<ea86ab799567bbf1f2fd02d47f9bdc775ba26f9e.1353602922.git.paul.eggleton@linux.intel.com>
	<20121204074429.GA6288@ad.chargestorm.se> <11016715.fxrlBBZh8S@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 11:20:26 +0000
Message-ID: <CAJTo0LZi1z7Enry_9T1VDvaOtmQgasyuwoFq6b2OUgYmf_-i6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQm8aYxEXHWZl7p33Z+7hBzkaWvgWgV2OdFRAaZcMHiXjyLyHU8k+wMrB3+FJanm+ZqHhDlq6jAKP1KjulinJS1XnZitMYD5xAKFEj0RB1A942uD2LFfm+PK/OqmDlDyqBFB7vRJ6LPItSn2Cik5iNmZdDVKJBLouAoy99A3QfJvNgX1VHFNeyzeI75MQ48RQkwYSQlM
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [danny?] Re: [meta-networking][PATCH v2 1/2] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Tue, 04 Dec 2012 11:35:11 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 09:21, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> IMO the original recipe was horribly broken, so I'd definitely support having
> this patch applied to danny as well, assuming people have given it a
> reasonable amount of runtime testing and everything's OK.

It's horribly intrusive but if ntp wasn't usable before, I'm happy to
merge it once it's had some testing.

Ross


