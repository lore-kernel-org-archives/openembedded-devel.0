Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 525AF6F564
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 19:53:26 +0000 (UTC)
Received: by mail-yk0-f175.google.com with SMTP id 131so10264635ykp.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=58WZ/5ORg3hDdtuMm/IA/4tQ1WQKSakOZJaeer9I298=;
	b=D1G4bZVzhfJ2iKmLbp3JE3+mRtsD6RDXm/xqAGsreDX6MinIzptqxXaaHJ7eGn6m0m
	Q/0SZL6TB4Qq4NJEMbQG82UQ/VZ+VyyX86lzTm7QW5KHfF6i7fy4Y72tGHwwazLUpgdN
	pAwf8zz5fDwMIPyKrJL81OIfL8dDxnMqEmK+Kr6MtGwg93amrqufCKwrexe1y2CJCeWN
	lpqtkS+lFVn83Vwq43qSPDQ3ss+gdu9aZw1h9bP1dANu8fPAn9BF9NTxjx2n32XgT13t
	uJ/lhlOpy0TBXddmeBRoMhewxUOmSHhA/tusMfPGknQ1Uqrxyk+Z/5OCBpjnW3ZNjwYw
	4mhQ==
MIME-Version: 1.0
X-Received: by 10.236.21.202 with SMTP id r50mr1305760yhr.140.1393876407064;
	Mon, 03 Mar 2014 11:53:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 3 Mar 2014 11:53:27 -0800 (PST)
In-Reply-To: <1393734165-15082-2-git-send-email-net147@gmail.com>
References: <1393734165-15082-1-git-send-email-net147@gmail.com>
	<1393734165-15082-2-git-send-email-net147@gmail.com>
Date: Mon, 3 Mar 2014 16:53:27 -0300
X-Google-Sender-Auth: OkZGM_Gt7SiQjQWnq1Rr2HrPr3c
Message-ID: <CAP9ODKry1B06oojCA15G26hxBNdt5JPbqEcUqZP4BSaEFL+rsg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v4 2/2] packagegroup-qt5-toolchain-target: include all modules for development
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
X-List-Received-Date: Mon, 03 Mar 2014 19:53:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 2, 2014 at 1:22 AM, Jonathan Liu <net147@gmail.com> wrote:
> This adds the necessary target packages for development with all of the
> Qt 5 modules.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Why are you adding qttools here? this is not need for toolchain use,
is it? It is need for host.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

