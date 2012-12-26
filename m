Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tnsgc-0007Yv-GN
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 16:14:30 +0100
Received: by mail-vc0-f180.google.com with SMTP id p16so8946940vcq.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HGBMsOhc9l+BdCjVP3TREB28MSkZTeHjElw3qrnxiB0=;
	b=S5uUdksQupiW2NWsaxhWZu2Za3PAiLGXGSVh9sQRQPEQE1MzNjIAA60FvE03uUI/VR
	0lRtpZfY70rE7YqaEsPxMvBYdmX/O26LLHJdD1aj8Ix9U7WYrIXp/WipfPKUB/c03U6G
	tEZ8KYkRRcZ1YWg6l5Lfo3E4CLREgqN+c3pW526FbTuN7nb4S0Bzky944PtDcu5u+/um
	HMhspUO5SDG4a0CpfKFCzZxE2Jmbhc2rOkgMEpmH/SZW5mrmyJQ4lFehVYmH4aGsexWK
	+fGrNuENaCNQBViuGTZr/5/bikVp2NjFOkMDAdO2CRSkw0939vNw+PF9vdEPKBiS6DsI
	FKXA==
MIME-Version: 1.0
Received: by 10.52.21.107 with SMTP id u11mr36366720vde.101.1356533973342;
	Wed, 26 Dec 2012 06:59:33 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 26 Dec 2012 06:59:33 -0800 (PST)
In-Reply-To: <CALbNGRTvGC6_g9nRWjCuB8t-sLA35PWuPJKb8gT=NC_y2D5kOw@mail.gmail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
	<20121226130115.GB8988@jama.palm1.palmone.com>
	<CALbNGRTvGC6_g9nRWjCuB8t-sLA35PWuPJKb8gT=NC_y2D5kOw@mail.gmail.com>
Date: Wed, 26 Dec 2012 15:59:33 +0100
Message-ID: <CALbNGRQwGorTBo7OOAABQVd_0Jmv7sS3W+NcDy2bocnw3eoKHg@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Dec 2012 15:14:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 26, 2012 at 2:29 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Dec 26, 2012 at 2:01 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>> On Sun, Dec 23, 2012 at 02:02:29PM +0100, Andreas M=C3=BCller wrote:
>>> The following changes since commit a623fd942f6561a425278cf9f114d212d06e=
5982:
>>>
>>>   samba: disable avahi and build without acl (2012-12-21 16:45:28 +0100=
)
>>
>> No new issues in world build with this patchset applied.
>>
> I know - these patches just add some functionality for xfce. I check
> for the gnome/libnotify problem next days. My assumption is that
> host-headers are dragged in somewhere but I need to check that.
>
> 'Unfortunately' I got a raspberry-pi for Christmas so I need to take
> care first :-)
>
I just checked: the gvfs patch dos not apply any more since the latest
update. I'll rebase the git repo.

Andreas


