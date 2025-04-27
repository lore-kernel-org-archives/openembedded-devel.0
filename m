Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6041AC369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 08:37:17 +0000 (UTC)
Subject: Re: [meta-python][scarthgap][PATCH 1/2] python3-posix-ipc: upgrade 1.1.1 -> 1.2.0
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Reykjavik, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 27 Apr 2025 01:34:30 -0700
References: <20250427083045.3757-1-gudni.m.g@gmail.com>
In-Reply-To: <20250427083045.3757-1-gudni.m.g@gmail.com>
Message-ID: <9729.1745742870785928787@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="C9zDISqq0HXQqcyMNf2A"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 08:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117161

--C9zDISqq0HXQqcyMNf2A
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

There are no new features added and only improvements made to the packaging=
. This update also brings in one bug fix: https://github.com/osvenskan/posi=
x_ipc/pull/56/commits/9bd6e84e072bda943e9c784587f4d6dfb0cc2405 ( https://gi=
thub.com/osvenskan/posix_ipc/pull/56/commits/9bd6e84e072bda943e9c784587f4d6=
dfb0cc2405 ) where previously the 'cc' command was expected to be present, =
which is not always true. Now the 'CC' environment variable is read instead=
 which can be set to something other than 'cc', like 'gcc'.

--C9zDISqq0HXQqcyMNf2A
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>There are no new features added and only improvements made to the pack=
aging. This update also brings in one bug fix: <a href=3D"https://github.co=
m/osvenskan/posix_ipc/pull/56/commits/9bd6e84e072bda943e9c784587f4d6dfb0cc2=
405" target=3D"_blank" rel=3D"noopener">https://github.com/osvenskan/posix_=
ipc/pull/56/commits/9bd6e84e072bda943e9c784587f4d6dfb0cc2405 </a>where prev=
iously the 'cc' command was expected to be present, which is not always tru=
e. Now the 'CC' environment variable is read instead which can be set to so=
mething other than 'cc', like 'gcc'.</div>

--C9zDISqq0HXQqcyMNf2A--

