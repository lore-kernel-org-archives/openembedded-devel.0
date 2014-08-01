Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E347E70732
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 07:38:24 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so1084492igd.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 00:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=YbZhoPaL4hPu0Glu0azRXTT0+RnlLfGrKh6kGdVtdHA=;
	b=vkBRxMmLo/uouveNJNTx5v7dvdktCofnFRn6aysvQt7wWoTTXs7JRwzQhQ77YNETT2
	XxNtzDbMX4SdTKLecBmtsaB+jPtOWwxky6gFd2+fGctJ6UUuFunm870mn4sU13FR9N7/
	h+NardIS9TdQJAFA11MJchaKEiGEtHhzkrYsqVTyCf3z0tXqZ0QOB2JtCvrZnkUqzLPB
	NhzYb7y9h9yh8Pcv/UmoEJGDPxV3JvoXufYcQr2DNKrA7pagfwhKwZboL9NW8t6cGRZj
	8tG6UbtaL46CEuBcOuNrdo878aIrexxzejOIo9XODM/C3P7wMa4NMz+nr12XH1YVJqWP
	OfMQ==
MIME-Version: 1.0
X-Received: by 10.50.25.196 with SMTP id e4mr4697074igg.28.1406878705091; Fri,
	01 Aug 2014 00:38:25 -0700 (PDT)
Received: by 10.107.9.214 with HTTP; Fri, 1 Aug 2014 00:38:25 -0700 (PDT)
Date: Fri, 1 Aug 2014 16:38:25 +0900
Message-ID: <CALYKT1i_Tp2746SvXOLvH2zrcOZD4Co+1anDGdbF=hGVPRa+Lw@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [boost]How can I include boost into the built image?
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
X-List-Received-Date: Fri, 01 Aug 2014 07:38:25 -0000
Content-Type: text/plain; charset=UTF-8

Hello list!

I'd like to enable (or include) boost, the C++ library, into my binary
image.
Could someone help me find how to do it?

I found a .bb file and an .inc file under oe-core/meta/recipes-support/boost
And the last git log under oe-core directory shows below :

* 24b9542 - (1 year, 8 months ago) xserver-xorg: restore packaging for the
DRI/DRI2/DBE extensions - Ross Burton (caf/oe/master)


I use qualcomms MDM 9x15 environment.
But I will handle MDM9x25, MDM9x35, ... This means I will handle up-to date
oe-core soon. So If you could guide me for those up-to-date. It would be
wellcome!

I found a mention about recipes-support from yocto reference manual :

6.3.21. meta/recipes-support/

This directory contains recipes used by other recipes, but that are not
directly included in images (i.e. dependencies of other recipes).


And I didn't find how I can enable boost...

How am I supposed to do this?

Thank you very much in advance!


Additional questions... :
Can I include python? I found mentions about python from boost .bb file or
boost .inc file.
What about sqlite, even any web server?

Journeyer
----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

