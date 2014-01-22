Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 729456E786
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 14:38:26 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id h16so519992oag.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 06:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=FcErtGOep08rGLWZUqd0fgr/sfziZo2k/MU8ezIhXcc=;
	b=GGzlRCbwKvJF7GX840OPr9JpctB7z/Pg/AJDEWW1F4VFKlYLD50IOneXTu841zq8PA
	rWd1n5PC7lL5zkMV6tDHEit7fQXmassPBGe5+0zws4HeHpHp5mLFwINNirhFu9bhksz3
	1Mm/ewIgXTtVKhGeAMvFmb3gIirFJJIMy7hHbPK+YASgX6wkZP1iqbMhYLH3y0/Zhfcu
	opFJG1+90eSz1hSoQ5qiURAk/uDALki6tU0S9IL8vsI8JfM4VkQWmBuofQ3Z43XuhiyB
	obUnDuivvHk5/WVcUjuL9IpO+v4fbkn1L6nxd828ECJEUIoJ/UqfdVCnIFWlWOxuUsPP
	z9rQ==
MIME-Version: 1.0
X-Received: by 10.60.135.130 with SMTP id ps2mr1581992oeb.46.1390401507450;
	Wed, 22 Jan 2014 06:38:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 06:38:27 -0800 (PST)
In-Reply-To: <1390377421-27374-1-git-send-email-ming.liu@windriver.com>
References: <1390377421-27374-1-git-send-email-ming.liu@windriver.com>
Date: Wed, 22 Jan 2014 12:38:27 -0200
X-Google-Sender-Auth: JiqP8tAaT-AyzLi-C6KPUiboOts
Message-ID: <CAP9ODKrLGoy=VcXBCETAp9FQYT-rVfdcJDZL=6aV_-Z76ze=sw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] samba: add PACKAGECONFIG for libunwind
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
X-List-Received-Date: Wed, 22 Jan 2014 14:38:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 22, 2014 at 5:57 AM, Ming Liu <ming.liu@windriver.com> wrote:
> Also add --enable-libunwind option for samba source3, otherwise, it will
> be auto-detected from sysroot, which will lead implicit results.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>

Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

