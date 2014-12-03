Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7071E60232
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 21:53:01 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id n12so12866602wgh.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2014 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=iQbAWD18ws/h+OKci4z3IIM+eMXKBHa4UMI5FtXiydg=;
	b=KDrSuujYQ+TrdUutZUA/ZewrT26p/eFwMziSl756KzC5RFqKP9m/zpkQVGfev51Bj4
	sn3rmnmv6IXCgxsFScinrNSAlnDvniNEyKQuP11NELIBgcCoQU4kUNteC4BORl18YhoI
	dYVgAuJ1WncQEBkIAf2WWAPadEYHJtoL0JzTyOuhin+rx5IVtznBjili1PM2Niqjo9Up
	/0al+SludAxiIN9bKC7JxLae+A5BkY7tXVX9OzRc4q1DFW1FVqjO8M9FzFLJTQ6ZbS8S
	7hQI6WaP9rU/lSlPp+TlWs6XnA0v/RDtExv7/+WSpoK2xjZ7QMCVIyaj9qWBJ0js6PZp
	tVjQ==
X-Received: by 10.194.222.1 with SMTP id qi1mr10732858wjc.29.1417643581508;
	Wed, 03 Dec 2014 13:53:01 -0800 (PST)
Received: from [192.168.50.245] (ip-37-24-44-195.hsi14.unitymediagroup.de.
	[37.24.44.195])
	by mx.google.com with ESMTPSA id ce1sm37947324wjc.2.2014.12.03.13.53.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 13:53:00 -0800 (PST)
Message-ID: <547F863E.7040109@gmail.com>
Date: Wed, 03 Dec 2014 22:53:02 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com
References: <1417605241-2992-1-git-send-email-sven.ebenfeld@gmail.com>
	<20141203180619.GF2455@jama>
In-Reply-To: <20141203180619.GF2455@jama>
Subject: Re: [meta-filesystems][PATCH] f2fs-tools: Update to Version 1.04
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
X-List-Received-Date: Wed, 03 Dec 2014 21:53:08 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 03.12.2014 um 19:06 schrieb Martin Jansa:
> On Wed, Dec 03, 2014 at 12:14:01PM +0100, Sven Ebenfeld wrote:
>> Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
>> ---
> 
> The subject says 1.04 and recipe 1.4.0.
> 
> Also next time remove old version (1.1.0).

I were not really sure what is "best practice". Next time, I will remove
the old version as well.

> 
> And use f2fs-tools instead of "files" directory for slightly faster
> lookup.
> 
> I've updated all 3 when cherry-picking to master-next.

Thanks for updating! I will use this feedback for my future patches.

