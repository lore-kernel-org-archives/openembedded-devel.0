Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RD5El-0000Da-Dg
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Oct 2011 04:05:04 +0200
Received: by pzd13 with SMTP id 13so16246229pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Oct 2011 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=UgHYXinjbxnCjzOaXf2ieYoBiVFI+oOpg2fNW/i6hs4=;
	b=p3xPlIz7TeZwwHKnwoq7hPoZwqHC/JcuFrdRTqjOob+1CKFosXVitoLAgowhT2WN7q
	ce+nly10Abr7uRnk4plfvLV+6X/gSWSKKc14Oa1CJFHm/AfwBkWX6t6IlR/UfRnHgb+c
	RzcJcm7uBpWSRdwwFYQzPFkiP3ZLdeUEWFFkM=
Received: by 10.68.8.195 with SMTP id t3mr33514106pba.107.1318211962054; Sun,
	09 Oct 2011 18:59:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Sun, 9 Oct 2011 18:58:52 -0700 (PDT)
In-Reply-To: <1318198305.3653.36.camel@mattotaupa>
References: <1318009164-6677-1-git-send-email-raj.khem@gmail.com>
	<1318198305.3653.36.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Oct 2011 18:58:52 -0700
Message-ID: <CAMKF1spM=-XJKoNVvBM4s+3sAST7_8bxbLi-wPxyk000eKR1wg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ldconfig-native: Change the license field
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
X-List-Received-Date: Mon, 10 Oct 2011 02:05:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 9, 2011 at 3:11 PM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> So should the field be changed to `LICENSE = "GPLv2+ LGPL"`?

GPLv2+ & LGPLv2.1+ would be ok however we do not generate packages
which are LGPL only
in this case.


