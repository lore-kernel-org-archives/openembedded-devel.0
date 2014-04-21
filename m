Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C108C65D33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:56:49 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rd18so3800995iec.35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Mth2KdzqXcpr+pIuZK7kQCPlICdDjijDU/w2HLLWKRQ=;
	b=qkED30YC6h1lbUqIsji7jT/czYBL7GjSh7ioY0ILckSzZ9s/R+/B9j7XSveIxXYQmI
	bsMDvmC7G69bsYQpzlc2JH/R6GR1P1JO+87/8i/yLuAuiJl9T3HonvcVjXoDFyjrxiCk
	8eOSSnEQBVe0mnRD+tJPefcs1ru0zognTNsDtVcLv+T4dNOgYq8rkIRxxsyaLeDFypbT
	r3J9tPddrfxbS7hqPsQ8SbZdQY7xNcFFbxKNKtHfkQbMHOxB9r22vilOFoxgJHxsj0HB
	3PdZcndhu1nqKrdKKIIrcedyDevl6w7muKRaS0Peo0f7K6V+lOwscNc1NV/8X5hBaBz2
	SJBQ==
MIME-Version: 1.0
X-Received: by 10.43.59.82 with SMTP id wn18mr30264437icb.6.1398081409763;
	Mon, 21 Apr 2014 04:56:49 -0700 (PDT)
Received: by 10.64.127.38 with HTTP; Mon, 21 Apr 2014 04:56:49 -0700 (PDT)
Date: Mon, 21 Apr 2014 20:56:49 +0900
Message-ID: <CALYKT1jF=ZHeU=cYgA55O5_SjJeCVLWMdR=Gwr9B0U_UVjYuZQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How can I use / enable strace of the image of oe-core?
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
X-List-Received-Date: Mon, 21 Apr 2014 11:56:49 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

I am the guy who uses oe-core for MSM.

oe-core for MSM is just a clone of oe-core.
And mine is open via codeaurora :
    git://codeaurora.org/quic/le/openembedded/openembedded-core
    https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome


I want to use strace to debug my application on the image of oe-core (for
MSM).
I mean I want to use it on target embedded system.

And I found strace from my oe-core source tree:
    oe-core/meta/recipes-devtools/strace

And there are:
    strace-4.6/  strace_4.6.bb

This gives me impression that I can use strace from my target system.
But there is no source code for strace... in it!

Then how can I use strace?

Thank you very much in advance!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

