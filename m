Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 57728601F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 11:12:03 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id q200so171874ykb.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Oct 2014 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=3Gdy9i+UbkwSsI1zXQevTjmgWWhXB5wNrar4+x702tc=;
	b=k2tRNuZ4TLl1/7oEQsJaKxm1C+VyfG/KAsveqQbv8V3jTz1YKiE+EH3gH2U/2QWhXc
	zLoxxkZxkx4/4v6rubFpdK9V0a78kAieDVMNm6m1dpA+d7mc0oURKm18xF0jl058ohdI
	GwFJmdBE4Q90QMJrx6VWipwo0BgpU/BzAXmeUuY+W+l+YeM8/zoonrn0RGmFd0GldlLp
	Qx2Q1TaH4M5AJaf11t5olG3EvewHkicGIw1696cwq5byFf6MyEjjBSP+Nb8NWudh000j
	rrx3nvfk8KWW7qd6TIF74HaeYEzzCUJk+W7Q/NY1k2Adl7QkMQN3RHdjg71oAfVpidGN
	0Cjw==
MIME-Version: 1.0
X-Received: by 10.236.231.161 with SMTP id l31mr2144827yhq.104.1414494723912; 
	Tue, 28 Oct 2014 04:12:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Tue, 28 Oct 2014 04:12:03 -0700 (PDT)
In-Reply-To: <1414423721-6353-1-git-send-email-kai.kang@windriver.com>
References: <1414423721-6353-1-git-send-email-kai.kang@windriver.com>
Date: Tue, 28 Oct 2014 09:12:03 -0200
X-Google-Sender-Auth: p5vnaInnrnML1CayssnKFWKElEU
Message-ID: <CAP9ODKpZjSyvjwBuqVbvoweJ0vMbcA-3+rSd4vYpo3J8YVXPNg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Yue.Tao@windriver.com
Subject: Re: [PATCH 0/8] Some CVE fixes of postgresql and libyaml
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
X-List-Received-Date: Tue, 28 Oct 2014 11:12:07 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 27, 2014 at 1:28 PM, Kai Kang <kai.kang@windriver.com> wrote:
>
> Kai Kang (8):
>   Security Advisory - postgresql - CVE-2014-0064
>   Security Advisory - postgresql - CVE-2014-0060
>   Security Advisory - postgresql - CVE-2014-0061
>   Security Advisory - postgresql - CVE-2014-0062
>   Security Advisory - postgresql - CVE-2014-0063
>   Security Advisory - postgresql - CVE-2014-0067
>   Security Advisory - postgresql - CVE-2014-0065 and CVE-2014-0066
>   Security Advisory - libyaml - CVE-2014-2525

The commit log ought to be:

postgresql: Add fix for CVE-2014-00xx Security Advisory

to follow our commit guidelines.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

