Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id D5F9865ED7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:38:35 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id c41so202945yho.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=RkkDWyCRtJ9EZODNPPuNiOO400wW5SjWyT0Ykodn1kM=;
	b=0RRrQeO9QBmTrYUtnMd5aekR9JJjeW8gB1v0j2ih1jZqJT4NpKAMrKoXVWeTxIFEYD
	EKoC/QQPv33JX8zuj6A7lJEX2y9d7iUcW2Z2EGD0TB08yIXEDGRkXCjb7W3AKotu+jDy
	qrWCyfR+Nd7fhBOkzCuH8qQ3B5ul7ibVkyanh0aEtpXhVbxTbEe2kUokCiftjLPRfDts
	gV7/qVDMFlEINLHiQ+vKzeZmF9p5LvNH6WYntZ33qdj8kh6ovUKH+G9BMp8xvtvPWmD2
	XIpfKu3Y23hY0HfxeLrSnqzG+p4dFyaisqBd8g08mSzWBaQgBMlz+Uwo/NQt3gjqt8sJ
	wB+A==
MIME-Version: 1.0
X-Received: by 10.236.124.7 with SMTP id w7mr77331935yhh.33.1401925116028;
	Wed, 04 Jun 2014 16:38:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 4 Jun 2014 16:38:35 -0700 (PDT)
In-Reply-To: <1401878650-3362-1-git-send-email-chmorgan@gmail.com>
References: <1401878650-3362-1-git-send-email-chmorgan@gmail.com>
Date: Wed, 4 Jun 2014 20:38:35 -0300
X-Google-Sender-Auth: sZKfAMX9-B00yJOB7mUGN3CRREg
Message-ID: <CAP9ODKoqUaswvNbhR02aX16EgKLmv6g6ws1Lkgpb00Gdmctg=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Remove dfu-util svn recipes, these point at deprecated svn repositories, dfu-util uses git now
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
X-List-Received-Date: Wed, 04 Jun 2014 23:38:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 7:44 AM, Chris Morgan <chmorgan@gmail.com> wrote:
> Signed-off-by: Chris Morgan <chmorgan@gmail.com>

Please rewrite the commitlog to adhere to
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

