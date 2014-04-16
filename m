Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD2765D44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 06:49:39 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so10188574iec.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Apr 2014 23:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=83brN1aAqNUkC+8D3iQcnvepiRwrPgXVelKvMKkSM6k=;
	b=uvIH3hNUmBI4ZBTpybX+yDChkJG/3d0lRMJFuR5ZX0uUL5/LbsZhVYnIROxDNbzTK+
	YCYL7oqKrlONhLVKngV6aEc4Y0KzM1SLk/SS2fsLYZ1ALj9IcKepOtzP5WOQi1qAaNqY
	eoWty+dkDH1VUA9ROegEoPPDgTPrj/OSokyqwimOb/o01syeqO/UGjIzxly8UxdjUgjZ
	ZWBuMrMe6OeWQ5BoPsPXuQoKAR3bNFWhyt6UDKNsvLa1U01rHAMTJ1wxVoZrBhutMhHn
	kOKi3F3SKrEiQ5rdJ6+4fm2vhUuGSCc32VTi5YDoCyyDL9Z07/HIjkCa86UlSnGpehmB
	6ogw==
MIME-Version: 1.0
X-Received: by 10.50.138.72 with SMTP id qo8mr8108876igb.26.1397630980183;
	Tue, 15 Apr 2014 23:49:40 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Tue, 15 Apr 2014 23:49:40 -0700 (PDT)
Date: Wed, 16 Apr 2014 15:49:40 +0900
Message-ID: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 06:49:43 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

First of all I thank Nicolas Dechesne and Brian Hutchinson, for the
previous kind replies.

While I was reading documents from Yocto Project, I found my source code in
use in my company is of Open Embedded for MSM.

I found this from the git remote url of my surce code. It is
  git://codeaurora.org/quic/le/openembedded/openembedded-core

And the one of Yocto project is
  git://git.yoctoproject.org/poky

From the git log prints poky is actively developped now but
openembedded-core is not.

In a nutshell(I learned this expression today^^),
- What is the relationship between those two? Any differences? Commons?
- Can I refer to the documents about poky for my openembedded-core?

Thank you very much in advance.

Sincerely
Journeyer

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

