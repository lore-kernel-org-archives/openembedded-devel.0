Return-Path: <just4tech83@gmail.com>
Received: from mail-qc0-f193.google.com (mail-qc0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC0C70254
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jul 2014 06:54:54 +0000 (UTC)
Received: by mail-qc0-f193.google.com with SMTP id m20so1871006qcx.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Jul 2014 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=M4SFNNKHaepNNmd5NucXLe79fbRlP/AWCl7WMTOkDqU=;
	b=WnwGXs5jd/BlJqmKxJ5EbDwp7cmteWiCAT7fKQrUbbvPUOe9aNep0KhUl67w9ZkiuF
	Eq6sFPSTW3MyRom58Eb0p+1mpD/oD2jwd6CGoCwDt2/eAizIUcYDCqBvLPNwkJC17NaI
	Vvwm82Q93Q9UOf1ifd0UE51Ztn4ejLYBWWE7mnHhr+3/V0TiRB4yXsCobMpAuG82Bf6y
	QLs1ew3Hir0a3Rb1HRdCw2GFoHd2k1ktaF2YIZ2dKq623rCa0MdPYFUVirlGjzrcZ+kE
	1qURgsCNeRI3TEEmiaSFRbJ4hAXiPtbZjfq+dRutN2PYyRmgtSUYIjvZ35IyARwjQQPS
	gJBg==
MIME-Version: 1.0
X-Received: by 10.140.83.209 with SMTP id j75mr52655478qgd.42.1404802495481;
	Mon, 07 Jul 2014 23:54:55 -0700 (PDT)
Received: by 10.140.16.103 with HTTP; Mon, 7 Jul 2014 23:54:55 -0700 (PDT)
Date: Tue, 8 Jul 2014 12:24:55 +0530
Message-ID: <CAD2C2VT=3DipX=8chChc6_NefZSfs3jocmYxePJp5THxANiKVg@mail.gmail.com>
From: Bryan <just4tech83@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: open embedded build issues with beagle board
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
X-List-Received-Date: Tue, 08 Jul 2014 06:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Hi All
 I am trying to build  Openembeeded classic for Beagle board-XM but i am
getting lot of broken link issues. I have  set DISTRO as angstrom-2010.x in
local.conf.   Is this approach  ok? or should i move to openembedded core ??
Pls suggest.

Broken link e.g.

Resolving www.angstrom-distribution.org (www.angstrom-distribution.org)...
140.211.169.177
 Connecting to www.angstrom-distribution.org
(www.angstrom-distribution.org)|140.211.169.177|:80...
connected.
 HTTP request sent, awaiting response...
404 Not Found  2014-07-08 10:13:43 ERROR 404: Not Found.

Thanks in advance

