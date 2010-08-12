Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Ojeac-0002Pg-9c
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 22:41:39 +0200
Received: by eyx24 with SMTP id 24so974537eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=awffC8mNhmenvh/zQbmyolqQD0U6CkzregNi108ALCo=;
	b=KJHSX6sZ8CL5iB3RdYgFOdjx3T4To22PlhCE3+G4fFdcdwUPWYhPjkS7gtG6NLgNem
	jU50/68HlrLsQOBnuIh40zDcN/GHftpWzffT/TVBAurdRDLwKnm0zSN0G+ziZC+a5i20
	efqsBJEtx/kytXPD/H0cU2m3vJ8HRP/GlFHdc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=tK7McOVf6ORptV7Nq0elSCtWNT8dDFyLtrQt7qxe+aKhDBJmHAgYZEcc67V83rGyVR
	wbUeJYxpyKi7yZTARJmNK3f6N2CUujS0a9Zb5Q1PxcrMANs1/zhZODNTCST16OiIRpeC
	lTaOSavF29gMjgGslEizVxxuxcTi1iVlv9Kwg=
Received: by 10.216.15.8 with SMTP id e8mr7186770wee.59.1281645663131; Thu, 12
	Aug 2010 13:41:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.166 with HTTP; Thu, 12 Aug 2010 13:40:43 -0700 (PDT)
In-Reply-To: <1281571508-3792-1-git-send-email-raj.khem@gmail.com>
References: <1281571508-3792-1-git-send-email-raj.khem@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 12 Aug 2010 13:40:43 -0700
X-Google-Sender-Auth: KSdMjrXmJsBim3o8zARhHJ8KaQQ
Message-ID: <AANLkTin4OUg1S1GYa0H8v1qHyvY77mHPVGF06=DkC5s+@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] srctree.bbclass: Also account fot deptask
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
X-List-Received-Date: Thu, 12 Aug 2010 20:41:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 11, 2010 at 5:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> * Use exec_func instead of exec_task
> * Use a new name for meta task
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

