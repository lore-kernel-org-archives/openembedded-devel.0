Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tnsuz-0007xM-7c
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 16:29:21 +0100
Received: by mail-vc0-f175.google.com with SMTP id fy7so8752880vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 07:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YkyoO3mBOobRyIWfUg80/V4n4mwe7qVAnWz9Gx/k9Nw=;
	b=o38w8re/DWJc1xHpCZ7D7dAD5WXtWy+VST6egb/DR020WIPBR8J6KSLpQFXZYpiVPR
	Vq7p2cw43l2WlNetMs5PIcrtiwI5n6mLd3eaON/dcL8KTZu5AjFxS+r9w2pLa8w78lDq
	7iF+CW2B1GhdEIcz5nYyMWwVkxde8+1ZvJOtHcAtCuKW4G4N2HlMfMCuhvMT9KvCRhWs
	9fAzHTReWr8FVl5xujWTbiS4XGIH3/wa8kzCj+3UTxcRHZwWMd/piAv2WjGrL4gFGAVX
	I8t0m8xfMM663Orj5seJumsFJJmUavJXiAn/aYhzEkWMc7idtq6QrPQ0YQb65Yad+bUH
	/U0g==
MIME-Version: 1.0
Received: by 10.58.33.66 with SMTP id p2mr43544843vei.24.1356534863996; Wed,
	26 Dec 2012 07:14:23 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 26 Dec 2012 07:14:23 -0800 (PST)
In-Reply-To: <20121226151310.GC8988@jama.palm1.palmone.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
	<20121226130115.GB8988@jama.palm1.palmone.com>
	<CALbNGRTvGC6_g9nRWjCuB8t-sLA35PWuPJKb8gT=NC_y2D5kOw@mail.gmail.com>
	<CALbNGRQwGorTBo7OOAABQVd_0Jmv7sS3W+NcDy2bocnw3eoKHg@mail.gmail.com>
	<20121226151310.GC8988@jama.palm1.palmone.com>
Date: Wed, 26 Dec 2012 16:14:23 +0100
Message-ID: <CALbNGRT9G2UYvRU_CVBJmhK4QzDLT+E-KesmD3rmsoTXXaggWQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce/meta-gnome 00/12] meta-xfce updates
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
X-List-Received-Date: Wed, 26 Dec 2012 15:29:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 26, 2012 at 4:13 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Dec 26, 2012 at 03:59:33PM +0100, Andreas M=C3=BCller wrote:
>> On Wed, Dec 26, 2012 at 2:29 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Wed, Dec 26, 2012 at 2:01 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> >> On Sun, Dec 23, 2012 at 02:02:29PM +0100, Andreas M=C3=BCller wrote:
>> >>> The following changes since commit a623fd942f6561a425278cf9f114d212d=
06e5982:
>> >>>
>> >>>   samba: disable avahi and build without acl (2012-12-21 16:45:28 +0=
100)
>> >>
>> >> No new issues in world build with this patchset applied.
>> >>
>> > I know - these patches just add some functionality for xfce. I check
>> > for the gnome/libnotify problem next days. My assumption is that
>> > host-headers are dragged in somewhere but I need to check that.
>> >
>> > 'Unfortunately' I got a raspberry-pi for Christmas so I need to take
>> > care first :-)
>> >
>> I just checked: the gvfs patch dos not apply any more since the latest
>> update. I'll rebase the git repo.
>
> I already did (and said that in previous reply), see contrib/jansa/pull.
>
> Cheers,
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
OK thanks.

Andreas


