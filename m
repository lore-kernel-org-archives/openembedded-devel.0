Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 85FDC76EBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 11:31:01 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so69665906igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=WJDa10KX2ofKtT3UzKv/ks4Q+r0MQzwK4p5OdG1qeoM=;
	b=XwoSNABbpaIcXDchADgtN1ScWUpitZdEG10Fch3w5uSptxuIYZQ/PtW7/nsSLnql+i
	sg6IzbV7TP/hPaP6ZuTgdEBDFFW3b2PP5CG+ksvz52AQ7P0wZz4C3jd1UYYiV+MeqSlW
	gSvgzMseZaB1zcimC0W702hllIaGUHkiba2tOB9C+sT7GMw6TESYCmlTYkHiPf6mZ/yq
	bifAYeDisRCsFqWhXO8NhbmcLZpPD9C7jCpTlucg1NvpC/fRruJ97oXuJ9XPbFXYbi8E
	YcRVUApwY70yuZfbt4+XgGonYT0sBB6QOpkHq9NUCMP+cf2TDDHJTmE8WSsYZ7Glk/x+
	p2ag==
X-Gm-Message-State: ALoCoQk+ulft1Az8a5GZXQDN04x9ap0h8ptddTwTWwvMtBtZYCw9cD4cfOOG0ZjTvQrQXPjLW3qf
X-Received: by 10.50.55.98 with SMTP id r2mr3066766igp.57.1445340661839;
	Tue, 20 Oct 2015 04:31:01 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180])
	by smtp.gmail.com with ESMTPSA id p1sm1233288igh.12.2015.10.20.04.30.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Oct 2015 04:31:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so18228881iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 04:30:59 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.27.136 with SMTP id b130mr3361086iob.28.1445340659351;
	Tue, 20 Oct 2015 04:30:59 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 20 Oct 2015 04:30:59 -0700 (PDT)
In-Reply-To: <5625864A.4000007@gmail.com>
References: <5625864A.4000007@gmail.com>
Date: Tue, 20 Oct 2015 09:30:59 -0200
Message-ID: <CAP9ODKp2=YxoDYhqhyePuwTexnwQaFeu2FgDD6N4iHpVwDaP5Q@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: dizzy-next sync to dizzy
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
X-List-Received-Date: Tue, 20 Oct 2015 11:31:03 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 19, 2015 at 10:09 PM, akuster808 <akuster808@gmail.com> wrote:
> Hello Martin,
>
> Are there issues with the changes in dizzy-next? need Otavio to signoff?
>
> Dizzy behind by:
>
> 7f1df52 fuse: fix for CVE-2015-3202 Privilege Escalation
> e3dbf78 ipsec-tools: Security Advisory - CVE-2015-4047
> 0fb90be mariadb: Security Advisory -CVE-2015-2305
> c580b62 libssh2: fix CVE-2015-1782
> e00844e ptpd: disable libpcap detection via pcap-config

I am fine with those patches. They are clear bugfixes and should to be applied.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

