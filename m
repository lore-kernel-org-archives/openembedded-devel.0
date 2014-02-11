Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 045A26EE8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 14:11:52 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id 29so6781614yhl.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 06:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=OLsPpF3XYG7My01IULMX0HbAE0ZbNbTg40PnFL2fVvw=;
	b=C4sIhNjmjMB+b5WrY1HWHI+qNPnhc9fde7+r5N4m9DDvTGc70pHyEF33W2TvwsP4yG
	fvPOLn1EUNXM4npcE5DdkcxiCTCqK/ArVSmDD3y4vH3jkVQWVllkGZv6yQlgB0Ys5Lv9
	rHzvC4vY70G3OzSdRN68kbxSdhpTvz6NzyGuqLyLLdUjzkNZdrEzP+v7O9BV8nz94uod
	T2KvDB+lp540lPK85cxifhE66Y614l0tiMS2+Qi4OBWIH2Q5BpmajixU0ije40jT7TZW
	m5iIlf9z71FC0UsROUp7/jMNu3O6tWWvH4lk7kusa9c/kDCkY8U6Ndpp80vWGntmh+wR
	jFhw==
MIME-Version: 1.0
X-Received: by 10.236.118.201 with SMTP id l49mr2210540yhh.78.1392127913187;
	Tue, 11 Feb 2014 06:11:53 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.161.3 with HTTP; Tue, 11 Feb 2014 06:11:53 -0800 (PST)
In-Reply-To: <1392067015-16328-3-git-send-email-denis@denix.org>
References: <1392067015-16328-1-git-send-email-denis@denix.org>
	<1392067015-16328-3-git-send-email-denis@denix.org>
Date: Tue, 11 Feb 2014 12:11:53 -0200
X-Google-Sender-Auth: sexQp_pIf3BI_fpSP-i4GKdCVLA
Message-ID: <CAP9ODKr-Sbmcv_DPketp02-PgXWscW=emmqP1jQmAMXY-jBoHA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 2/3] nativesdk-packagegroup-qt5-toolchain-host: add Qt5 SDK host tools
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
X-List-Received-Date: Tue, 11 Feb 2014 14:11:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 10, 2014 at 7:16 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

I checked this and the installed packages are the same we are
installing in our branch[1].

1. https://github.com/meta-qt5/meta-qt5/blob/ossystems/nativesdk/recipes-qt/packagegroups/nativesdk-packagegroup-qt5-toolchain-host.bb

I will discard this one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

