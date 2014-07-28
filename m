Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D485D6FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:58:47 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id tr6so7196242ieb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 12:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HfniXgxN735C9ip4++jPKV46zUaf2rhPOsALKbXnQgo=;
	b=nyXs+jxrwWHNJfNyJbn8CQgEagwLKiyjs14k8e++0iz+1RZYWOH7B1PqrZqvgUl6M/
	J5BShYM64wleRY+5a3cuQs1fPQnWRvROt8IsV8V2PpiCOkrfjTpkflwDQv73KTwTZjBq
	tHqUQQXIijuEIqJyf6ANzyQKs9Dq5GtIFN+KvCfbiBfziX3DgYSrupTpaaY0xKt+jqXc
	vObbUPLlRj9xVyRfyk95JEFgXuL0rcei/PVod6qB7BrSAGLcbDQBTxVa6urdCQGaVBdF
	ur4QQozWhRegFUfLCPxh56NCCYVUpx1PDNlsoX1vpvG/p64PgwNiBwmjOq1RgNbkgCQJ
	n7aA==
X-Received: by 10.50.13.102 with SMTP id g6mr36281379igc.20.1406577528373;
	Mon, 28 Jul 2014 12:58:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Mon, 28 Jul 2014 12:58:18 -0700 (PDT)
In-Reply-To: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
References: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Jul 2014 12:58:18 -0700
Message-ID: <CAMKF1sor__WRSb_Yo_G1+NhDX0TF8uY5tXAfMJQBgfD7um1rOg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] font-misc-misc: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 19:58:51 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 28, 2014 at 12:26 PM, Ben Shelton <ben.shelton@ni.com> wrote:
> +RDEPENDS_${PN}_class-native = "font-util-native"

there is no native bbclassextend here so why is this needed ?

