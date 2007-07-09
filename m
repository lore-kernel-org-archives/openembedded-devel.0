Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1I7hdw-0003ew-38
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 03:02:27 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 71A066D0B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2007 20:56:52 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sun, 08 Jul 2007 20:56:52 -0400
X-Sasl-enc: ERyUYaOK9z5gHvpks/iukRTGQ28Kvfq1KmS6ZpQxLaCL 1183942610
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 241381B1EC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jul 2007 20:56:49 -0400 (EDT)
Message-ID: <46918727.60103@whitby.id.au>
Date: Mon, 09 Jul 2007 10:23:59 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.12 (Windows/20070509)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
In-Reply-To: <f6q30v$s2$1@sea.gmane.org>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 01:02:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>>> MACHINE_DISPLAY_WIDTH_PIXELS=
>>> MACHINE_DISPLAY_HEIGHT_PIXELS=
>>>
>>> to machine configs.
> 
> We can add those without adding formfactor. But what will those setting be for e.g. an
> nslu2 or efika board?

Since those MACHINES will not have the 'screen' machine_feature enabled,
it doesn't really matter, does it?

-- Rod


