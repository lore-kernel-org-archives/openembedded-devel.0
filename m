Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UK7FJ-0005p8-L9
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 14:15:30 +0100
Received: by mail-vc0-f181.google.com with SMTP id hv10so4747540vcb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=mVrIIAJ2t6UIKTHz/QIOmlcW0l+SEZW2udHne/0nEzI=;
	b=pGkpBCD+OwUrkqSDGdeuxsZ+KKWbGTb8B4VtnT1RuPbty3Ll9VSao8X4/Dvtobqpj3
	5HfoKRVI9JMQeKCCmdUy5d7DTcgf99gQ0g1FuyLjfNlrMYxIgQkuy+Mbggnbac7GXeND
	N0EvYVc69lRxRDzdnzXcbY98+MJCnb79GsTi7aU0730Rpsx0aL0W79WKDjj/q9QtBk0D
	D2aCoVdEqWQICkd5t/Uz/SPiYXfYTN2jxzH2vzcPMwhmI+w3ZRrqq793uILaq/zgmcOk
	jN5nLxp3Ln8hJ6k+uIeByC0ofU7pFbR8I0hZnckAdc8QDoWrjJACJc93HLo9DRHIdsuy
	hEOA==
MIME-Version: 1.0
X-Received: by 10.220.151.203 with SMTP id d11mr15503153vcw.9.1364216311185;
	Mon, 25 Mar 2013 05:58:31 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Mon, 25 Mar 2013 05:58:31 -0700 (PDT)
In-Reply-To: <CAJTo0LZ9+bq9_SZAWziKoDeRw0kJMCjwR=-m7FTCOqT3wuaUSA@mail.gmail.com>
References: <cover.1363973088.git.ross.burton@intel.com>
	<9ef1ee1552757f3cf5cb979a9df7cf45f38b2f7a.1363973088.git.ross.burton@intel.com>
	<CALbNGRQ7B6x55wvuwSkZy6TwMV73VLAMbKJFS+f1D-dr6Rkfpg@mail.gmail.com>
	<CAJTo0LZ9+bq9_SZAWziKoDeRw0kJMCjwR=-m7FTCOqT3wuaUSA@mail.gmail.com>
Date: Mon, 25 Mar 2013 13:58:31 +0100
Message-ID: <CALbNGRTGfROZL79sL31JRiOhLbS_+wYVe=g-x+m8J-7_ouwgwQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 01/22] busybox: enable systemd integration for syslogd
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
X-List-Received-Date: Mon, 25 Mar 2013 13:15:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 1:53 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
> Hi Andreas,
>
> On 25 March 2013 12:47, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
>> Wanted to give patches 01 & 02 a test - to fix tmp.mount issue. patch
>> 01 does not appear in patchwork and in gmail 'Show original' I see
>> only binary data garbage. Did something go wrong on transmission?
>
> The patch has UTF-8 content (your name, ironically) which must be
> setting patchwork.
Yes - I need to get another one :)
>
> There's a branch in poky-contrib, ross/systemd.
Will get that one - thanks

Andreas


