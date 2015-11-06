Return-Path: <gurrieristefano@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0041476E70
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2015 08:09:17 +0000 (UTC)
Received: by iody8 with SMTP id y8so116562171iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2015 00:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=qpO1H9vnmm5RvIqI3DTOX/E8ltQUL1lomRg2cy2SDdc=;
	b=cz+6cBt5gvtiA7eUc9MIzvDZWCDmM7ZqJALPemmufDuDxp0fSuAFamu7RbFDcgxx4i
	ZbsofT8ZN2sC244hkDK/LigvzBRBJnhLRfU16o0Hbxxv3ONRxysM2Q/+j0/W2e00oi2y
	+EfKbhb0ZCarjEMxkM+j+bkhkk4sT4JKPA8VFOd5A9Ig+0Kexg2gAf1gIDzgNULPPPhm
	ZaJ4Ohlc7iAFz4We6aOuen/Q4TdVsAX9ji7aoLvmXfYD/N72WPbkRxQ+0jn82BK2w5Lv
	Ml3KUcXEkrIKOFase9ppNtEAgPz4kgZ+oowne36NVrRcyfBgP4Tepfts1uvgIID1++Y0
	p56g==
MIME-Version: 1.0
X-Received: by 10.107.150.12 with SMTP id y12mr15898492iod.52.1446797357587;
	Fri, 06 Nov 2015 00:09:17 -0800 (PST)
Received: by 10.107.192.5 with HTTP; Fri, 6 Nov 2015 00:09:17 -0800 (PST)
Date: Fri, 6 Nov 2015 09:09:17 +0100
Message-ID: <CAKpvFF2ju_ADjOpmcgRE4Fw87Opp39uWPxGNrKoaxk0eqcT5uQ@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org, interest@qt-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: youtube view demo not work
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
X-List-Received-Date: Fri, 06 Nov 2015 08:09:22 -0000
Content-Type: text/plain; charset=UTF-8

Hi people,
when I try to run the demo qml youtubeview on my target, I see:

qml: Something went wrong, received HTTP status code 0

could someone help me?

Target is correctly connected to internet.

Thanks a lot,
Stefano

