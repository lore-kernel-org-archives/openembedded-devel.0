Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id A7B0A65DC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 14:20:23 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h18so1094136igc.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1oiwH/pSSTtpJgkb4SQSJ7WlB3MswZ95itTt6EHbl9g=;
	b=pZn2Ds4TyVYXlSTJMcYf4dO02hgZtVIODzvU1cb6IfUQGJ6eZj/Is5mDCCWSiYBV6h
	ii+H1d9vf/d4brtgvlVpIJULwZxikdsIeyKycQ1QDKWxzDjlbqQrBY+TKA4v6aGjw4fU
	plg2d/9jG2Os5ngDB5JJEhikdNJ7rTdrGlhqKutuyT1dkwXGztSMjJKfGlnCz+VPG5TB
	mOBacQxF8IiIGDntH23oD4g3UwKdEGr3OvxB3PDVRyrRqxWwaa1yZ+PQO501YgTP0RfQ
	cJTtoeanGTkMRVId7+E8a5FrFX81CzYLxql+UoWVKWwk5eaxxAqe+F3q1NWZ/7rRfwhn
	ZMDg==
MIME-Version: 1.0
X-Received: by 10.50.62.105 with SMTP id x9mr26038596igr.10.1396966824248;
	Tue, 08 Apr 2014 07:20:24 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Tue, 8 Apr 2014 07:20:24 -0700 (PDT)
Date: Tue, 8 Apr 2014 23:20:24 +0900
Message-ID: <CALYKT1gcCmYKqy55T3Xv7qevR2g-EWv-y9dabjzz-D8psdYF2w@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: How can I use gdb in oe?
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
X-List-Received-Date: Tue, 08 Apr 2014 14:20:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I use open-embedded in my company.
It is used in Qualcomm's communication module - specifically on AP
(Qualcomm's chipset is composed of MDM + AP).

And when I compile oe linux, I use bitbake.

In this environment I'd like to use gdb to debug applications for this oe
linux.

How can I use gdb in this?
I have experience in using gdb in just PC environment. Not in embedded env..

Thank you very much in advance!

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

