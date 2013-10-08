Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 018806CC42
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 01:03:53 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id x13so18361768ief.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=reelJA6J8eaLvY3FI1azthWl4heZDI16cJPPiZU86KM=;
	b=xCmrTzZ/ifD2M5eNlwttPN+8h8S+vionQZusoWyUkMqW5ZTGJvL7RlbR3sjarDUO7g
	WVpWIuVnXbss3xDN83tgYYBubkwB+j/yHOq3geO4Q3+RHAFiPjfvoozIfgjF5EHfGfQs
	C30MCvPP/Ukx0IzhxS3BuswfKAVyguUkpX68ZM4BQ+bbV58/ye9pmpYqfOUgL7Hdd+D8
	32nt1AKKyEvh7Aib9ybOBGO7ZpZmxc0wpFawj/DsEyyIKu8NIuA3yVPPjnjAwIBYgqiZ
	uOqsjBQendiGnHZHMtsZXFgoQfyCazDE7MZVw+dIoa8LmZ2Sxy6b/ckPCyK+DfAly0Ql
	IHAw==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr19448711igb.6.1381194235536;
	Mon, 07 Oct 2013 18:03:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Mon, 7 Oct 2013 18:03:54 -0700 (PDT)
In-Reply-To: <CALmOhgmsSCvdcwGO-op9QtoNyF_bTkVsbj5BYmMg3uszXGUEsg@mail.gmail.com>
References: <20131007180120.GC18775@denix.org>
	<20131007202956.718ce202@e6520eb>
	<20131007183739.GD18775@denix.org>
	<20131007205710.386447ba@e6520eb> <20131007193306.GT6240@jama>
	<CAOMwXhNV3q5P_+kCZtnDNUpZpG-OvMoe7Rem=cw86Z6vx8WmbA@mail.gmail.com>
	<20131007194922.GE18775@denix.org> <20131007201536.GU6240@jama>
	<20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CALmOhgmsSCvdcwGO-op9QtoNyF_bTkVsbj5BYmMg3uszXGUEsg@mail.gmail.com>
Date: Mon, 7 Oct 2013 22:03:54 -0300
X-Google-Sender-Auth: Iva5Zd6quBfQDO8L4n8HB0a2MFY
Message-ID: <CAP9ODKqm5-=6XhquH5R2uTJW5+5TGVXrD8q86BPg0abRci-_1w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Tue, 08 Oct 2013 01:03:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 7, 2013 at 9:57 PM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Would the intent here be to replace 5.1.0 with 5.1.1? Or to have both
> versions available and let the user choose?

I'd prefer drop 5.1.0 and move to 5.1.1

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

