Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDE66013D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 14:45:06 +0000 (UTC)
Received: by wizk4 with SMTP id k4so157364553wiz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=VYVavdy/iCVtAbuuGQJw3++bh1CzG/Wnx3fBhXjJ5pM=;
	b=dF8jhDhF91HQYGv3KNr43IqKBxHpxqf4LBU/Tg+7rTwZXripL0O5e4LwJySQ/e1XgO
	E16khNxxBbYpWQxesbmUjI7Qtuz3bSm7tchO8mU/YPJnsuT42E6Khyy7rQFOOTq3DDaL
	wB3pEjWGN3zd1PeOaOEbk0LWrkh7Zkrsb6Rm47kFBmrsRGlvtpTGtnbvvXWzMfMLaFYn
	PxHKQjzgO71Eo6MHNAiniFdvRyW/smuV/qoOlj4RdgDlVOpbcMg5umhSFfH51rYuLfjN
	A9284fr9FTDK0pNwuYMFVrj7BZcORgzU0rcDgzwwBE8496RvVxBCnp1NjNvUqsHxnXtE
	ZhPg==
X-Received: by 10.194.87.38 with SMTP id u6mr31665902wjz.24.1431441907279;
	Tue, 12 May 2015 07:45:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id be3sm3194521wib.21.2015.05.12.07.45.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 May 2015 07:45:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 May 2015 16:45:11 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150512144510.GC2714@jama>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<20150511092704.GH2400@jama>
	<10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Tue, 12 May 2015 14:45:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2015 at 01:43:19PM +0100, Paul Eggleton wrote:
> On Monday 11 May 2015 11:27:04 Martin Jansa wrote:
> > On Fri, May 08, 2015 at 03:42:16PM +0800, Yi Zhao wrote:
> > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >=20
> > Changes 03, 18, 20 didn't make it to patchwork, because they were marked
> > as Spam by gmail
>=20
> Hang on, I'm confused. Why should the patches being marked as spam in gma=
il=20
> have any bearing on whether they should show up in patchwork? Surely gmai=
l=20
> shouldn't be involved in the sending part, only subsequently when the mai=
l is=20
> sent from the mailing list to you (since you use gmail)?

Isn't patchwork reading some gmail account over imap?

The list of patches not appearing in patchwork is exactly matching with
patches marked as spam in my inbox, so I believe that the same is
happening in patchwork's gmail account.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

