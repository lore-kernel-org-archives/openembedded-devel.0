Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ShmPX-00062m-0x
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:47:19 +0200
Received: by yenl13 with SMTP id l13so741289yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 11:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hrshs5X3/O+sPQxlRbb+aHdBdtX8vlRW/PIi5DMU04s=;
	b=BErSmzFuaSbVnzRyJ02JrTMhDIs3kqLvLBuaAFa+eSq1kN7F94ihAg8pANTy307Pcv
	TBGaChKyXMZXpJtlQ7VK9OJHQCsByyqaBg+t4MXyFtp2FzRRXMNsoibSuC+uYRxTdevt
	XxnEQB63gNDpzkoyXXR3xYBrziaDYbSALfslI3rw3dm9Uv8dHIxfozGpTsnUwr1CA+9s
	9EvmBT4AkS8RbrzSBIxnelbX+n4f0vTFUfD6UAmoJ2Uxj6nKYlCcE4Y/yXpGIPtKkbNI
	/6nUWoCerdm87w4qOcFFEoA8zyufv8/gAnnxYIajG/LJfzKmCZWz4w1SiIcLY/WqY6Nd
	ON/w==
MIME-Version: 1.0
Received: by 10.50.156.228 with SMTP id wh4mr8587056igb.47.1340303453602; Thu,
	21 Jun 2012 11:30:53 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Thu, 21 Jun 2012 11:30:53 -0700 (PDT)
In-Reply-To: <20120621181047.GF9352@jama.jama.net>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
	<1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
	<jrvngo$vv$2@dough.gmane.org> <20120621181047.GF9352@jama.jama.net>
Date: Thu, 21 Jun 2012 20:30:53 +0200
Message-ID: <CALbNGRTMYfuL7YFCp=RG3cCzkVEuE6cbv00yFqioN4AH0UsMfQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 18:47:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 21, 2012 at 8:10 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Andreas said off list
unintended - sorry
> that he plans to send v2 of whole patchset (there will be small change from gpsd too).
Did I miss something here?
> Andreas: do you want me to send v3
> or will you fix SOBs yourself?
No need for V3.

By the way: before I rebase this series: Are there patches around for
latest oe-core updates ( at least connman was updated ).

Andreas


