Return-Path: <sadlife1990@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B60607385B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2015 12:06:43 +0000 (UTC)
Received: by wghk14 with SMTP id k14so15826699wgh.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2015 04:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1tQkxZ2a8cFhZ+mOioShoi935dJDhe7i/rpJgvgp9Nc=;
	b=IeuMt2FcgR8qo/1Uw+YeJhTyBHX0Ywm692PKU4YoRqKbXdC/kopLlb3XmeU6ags+YU
	P5WEfckVC8UT3ldZly87B4JWwEqzCKOBYL2wukVlCPa3e/8XczaU19ig4Fkc6msajR5J
	0eDwOfWjvH8tjMaUvuGGOP99yZtmplyWEvM4bzSW5LAd2F2HxEpRyrwZSQwtykQ4ZRUq
	fWsfIglR15UI5cHOKggMZWHxgaOIRS1L8cIJueNQLBPxUSd9XdeUGt0xoDSRcUN5rE7l
	aM8Oar1ZQMfjuDkswK23Zl+n08fgHaJxPAIxGvV3Epf51TH/pAoR/hl3Q/cGEjqY9VaS
	MkQA==
MIME-Version: 1.0
X-Received: by 10.180.219.102 with SMTP id pn6mr31611857wic.50.1425643604246; 
	Fri, 06 Mar 2015 04:06:44 -0800 (PST)
Received: by 10.194.36.196 with HTTP; Fri, 6 Mar 2015 04:06:44 -0800 (PST)
Date: Fri, 6 Mar 2015 14:06:44 +0200
Message-ID: <CAAHuHfyJJUiAYxOAhn521eFHB8gA8x9PTixhjr5GSnnT2uGXmw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Yocto Cups Print Problem
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
X-List-Received-Date: Fri, 06 Mar 2015 12:06:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

We are testint cups with embedded system. I want to try print simple
echo "Test" | lp it isn't working. I see this error.
lp: Unsupported document-format "text/plain".

