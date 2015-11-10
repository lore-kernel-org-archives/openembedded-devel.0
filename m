Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1451C76294
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:18:58 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so28514328wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=utbxoVPf63BkLTGWqE8ZSiEAr9SiFIs2EWAz5IG9VcQ=;
	b=TMB2QwABBvL2NoG7T+cfTW2sZMkgU5OdVS4IXtt1tsAG3Jap+uuAlqFqcWMmXWX2yR
	dBskA5nRC70h3+nhLCeFcv002f5WcF8yG7AcghyM5PQ/PTQSOxSFe/SV9iURkvtYqyaB
	0chPujRyEpT0H3a3epXjVQu++gua7BpQqyysixJouxtSzffkflj5LPgSo3mQZb3Kxbhk
	n119ziziTyE/VIMxvJ0FqUqy5oouuigxOyr9B/ykE9LlYS9WuprBavex9vngm9CcpwTl
	vU4V4zcVIvQzLk5ZEUJRTxvjg+8Kk+/QFaDgjyzelWPH6rlXic+PbY4icxToOB5hIU+o
	FmUw==
X-Received: by 10.195.18.6 with SMTP id gi6mr5941644wjd.83.1447190338080;
	Tue, 10 Nov 2015 13:18:58 -0800 (PST)
Received: from chl500346 (c-82-192-248-24.customer.ggaweb.ch. [82.192.248.24])
	by smtp.gmail.com with ESMTPSA id
	vr10sm5526836wjc.38.2015.11.10.13.18.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Nov 2015 13:18:57 -0800 (PST)
Message-ID: <1447190335.2528.3.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 10 Nov 2015 22:18:55 +0100
In-Reply-To: <CALbNGRRqc-MUa++9kU8A=tgRKf=1BG-0huwQMHcJ294gJcuAuQ@mail.gmail.com>
References: <1446719398-14391-1-git-send-email-adrian.freihofer@gmail.com>
	<CAJTo0LZ=_5fwRDRXsY9sHNfq_XMjp6RQ4neGcCT2rs+od0Gz0g@mail.gmail.com>
	<CALbNGRRqc-MUa++9kU8A=tgRKf=1BG-0huwQMHcJ294gJcuAuQ@mail.gmail.com>
X-Mailer: Evolution 3.16.5 (3.16.5-3.fc22) 
Mime-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libqmi: update to 1.12.6
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
X-List-Received-Date: Tue, 10 Nov 2015 21:19:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andreas
Sorry, please ignore this patch. I will send a series of patches
including a modemmanager update.
Adrian

On Thu, 2015-11-05 at 12:42 +0100, Andreas Müller wrote:
> On Thu, Nov 5, 2015 at 11:49 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > 
> > On 5 November 2015 at 10:29, Adrian Freihofer <
> > adrian.freihofer@gmail.com>
> > wrote:
> > > 
> > > +++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.12.6.bb
> > 
> > 
> > Wrong list, this should go to openembedded-devel@.
> > 
> > Ross
> > 
> When sending to correct list: Could you add the error message in the
> commit message please? I am wondering why my builds of ModemManager
> don't fail.
> 
> Andreas

