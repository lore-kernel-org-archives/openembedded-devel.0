Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id C3BFB6B7B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 18:19:05 +0000 (UTC)
Received: from [192.168.1.68] (78.70.193.230) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 1 Jan 2014 19:19:04 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388581046-8713-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
From: Anders Darander <anders@chargestorm.se>
Date: Wed, 1 Jan 2014 19:18:44 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Message-ID: <d67ca952-cdaf-4916-bdc0-66b4f61a788d@email.android.com>
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-oe][WIP][PATCH 1/8] ktap: upgrade to 0.4
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
X-List-Received-Date: Wed, 01 Jan 2014 18:19:07 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"



Martin Jansa <martin.jansa@gmail.com> wrote:
>* tag v0.3 (and its SRCREV) doesn't exist in any branch so latest
>bitbake refuses to fetch it
>
>Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

This one looks OK to me. I was planning to do the update next week, but that patch could just as well be based on this one instead of the v0.3 recipe. 

So if we want a quick fix for the bitbake fetcher issue, take this patch. 

Acked-by: Anders Darander <anders@chargestorm.se>

-- 
Anders Darander
ChargeStorm AB          Tel: +46 702 44 84 36 
Drottninggatan 20       Email: anders@chargestorm.se
602 24 Norrköping       Web: www.chargestorm.se

Sent from my Android phone with K-9 Mail. Please excuse my brevity.

