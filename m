Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id D6F066B711
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:45:26 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id b6so209031yha.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=uQyLhKtOI/s39+cZlkGl8VanZ1CZfVhSnakUgEc9mdU=;
	b=EpWZW+apbCG6rercazp6zQWt1zH34B+Odo5hz6kwaTi4aw2vFXAVBeC5xh26mdCYNr
	jpIPHFcuyDd0IPrGrBGXIL8rzpPflq4riC7MmIibo6jVkBiI9JRN8veqxqj1m7RDcO0X
	hYjZFRPAZyWusSLwrCUxCcHbhwetWcLIXT9NKhaPPs/68WGto+/EMouJbJrqoreCYEOs
	Tji16XPRaZt8EqnT09Q5SuYzHWqAk8TJvQeKcbgjkpLjYp9ydMfYSz3YqjEH1WoO8jUb
	3BzOeBVZa2nHigTqkMhcbTCqjNy9AxBtVJgwGQ8v288Mn62b3AdNEsZES3Ut11w2utlR
	r08A==
MIME-Version: 1.0
X-Received: by 10.236.162.130 with SMTP id y2mr24252684yhk.78.1401925527439;
	Wed, 04 Jun 2014 16:45:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 4 Jun 2014 16:45:27 -0700 (PDT)
In-Reply-To: <1401875817-30867-3-git-send-email-Martin.Jansa@gmail.com>
References: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
	<1401875817-30867-3-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 4 Jun 2014 20:45:27 -0300
X-Google-Sender-Auth: TJRGn80Dhr0xzjDfzE2dFmvJL5o
Message-ID: <CAP9ODKpkAZsc6zUaEG_r9dT_LqrS6fmsCHFEV+dwfP67Ew=VPg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 3/5] qtenginio, qtwebsockets: Add 2 new modules and include them in packagegroup-qt5-toolchain-target
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
X-List-Received-Date: Wed, 04 Jun 2014 23:45:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 6:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> From: Jonathan Liu <net147@gmail.com>
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Please split the patches.

One for each module, than another for the packagegroup.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

