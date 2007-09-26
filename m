Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IaM4D-0002qj-9f
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Sep 2007 03:51:57 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 7513E4124A8;
	Tue, 25 Sep 2007 20:47:31 -0500 (CDT)
Message-ID: <0c1101c7ffdf$22091940$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
References: <8c7950360709231220o100ae1d6i2582e20398b04521@mail.gmail.com><1190628401.6176.39.camel@localhost.localdomain><46F79A90.6090709@student.utwente.nl>
	<8c7950360709240636r523b582dx89a7706682776117@mail.gmail.com>
	<0be701c7ffbf$cc912850$6e01a8c0@twilight>
	<1162450671.20070926030844@gmail.com>
Date: Tue, 25 Sep 2007 20:47:01 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Adding support for DirectFB across the board
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2007 01:51:58 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

>   That's exactly what it does - it says something like "Consider
> defining PREFERRED_PROVIDER". It's notice though, IIRC.

  I know that message - I've seen that in the past (and have taken action to
resolve the ambiguity it was pointing out).  But bitbake doesn't print that
message in this situation. :(

Mike (mwester)



