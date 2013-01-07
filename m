Received: from mail-ie0-f172.google.com ([209.85.223.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsKxa-0000Re-0Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jan 2013 23:14:32 +0100
Received: by mail-ie0-f172.google.com with SMTP id c13so24381295ieb.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jan 2013 13:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=khUCKgLxLWRSd6/xnR+UK8I6W8p0pi14pNe581+Xaio=;
	b=xF5aEf6xYlL5EJUC1UvI5J24ucja+ur6W0hqv1PVX+BR72h8FucvPFcvMDkCLOqx1j
	r+K7vnx5ozsa8quV0jIDIY/69NHyIbsGrVTQUYO8ovPEL8Pf/IKCGD3jmKs8rhfbWhs0
	PgWA8tLIv/hgLjzyZRPYGbEB526/G0dGU2R/kHtVYB9awmTSDddgEV7omip9ivWLp8Y2
	KNCg2G6RCNk1BKrUqtcael21fEwCVXar/DJjnUMuStkxorZOVOX1KGvrA1sHbQjrDcbC
	fnt2LCHgydOlKyDWrIAkMPQQXqMiCv7/CLhAFTjKzQFH8wcMGXPI6jtj0vb98GfdHjpA
	iEYg==
X-Received: by 10.50.184.199 with SMTP id ew7mr6958508igc.84.1357595951930;
	Mon, 07 Jan 2013 13:59:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Mon, 7 Jan 2013 13:58:41 -0800 (PST)
In-Reply-To: <20130107181558.GF3285@jama>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-13-git-send-email-raj.khem@gmail.com>
	<20130107181558.GF3285@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jan 2013 13:58:41 -0800
Message-ID: <CAMKF1spPeb-_h7GyDSY6W7cTnn50ZUP1DvmtgQni5O4nXE3_pw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 13/25] concurrencykit: Add recipe for latest from git
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
X-List-Received-Date: Mon, 07 Jan 2013 22:14:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 7, 2013 at 10:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> | Detecting operating system.......success [linux]
> | failed  [unsupported]

it indeed is unsupported for anything other than ppc,ppc64,i386,x86_64
as far as OE is concerned atm
I will add proper supported host regexp for this in V3 and push it to the tree


