Return-Path: <kernel@tekno-soft.it>
Received: from mail.tekno-soft.it (li153-180.members.linode.com
	[109.74.206.180])
	by mail.openembedded.org (Postfix) with ESMTP id B92D665D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2014 12:46:16 +0000 (UTC)
Received: from dragon.tekno-soft.it
	(host142-53-static.94-94-b.business.telecomitalia.it [94.94.53.142])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: robyf@tekno-soft.it)
	by mail.tekno-soft.it (Postfix) with ESMTPSA id 4131A1782D;
	Wed, 20 Aug 2014 12:51:20 +0000 (UTC)
Message-ID: <53F49881.3090409@tekno-soft.it>
Date: Wed, 20 Aug 2014 14:45:53 +0200
From: Roberto Fichera <kernel@tekno-soft.it>
Organization: TeknoSOFT
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, meta-freescale@yoctoproject.org
X-Intuitive-System-MailScanner-Information: Please contact the ISP for more
	information
X-Intuitive-System-MailScanner-ID: 4131A1782D.A6BF9
X-Intuitive-System-MailScanner: Found to be clean
X-Intuitive-System-MailScanner-From: kernel@tekno-soft.it
X-Spam-Status: No
Subject: [ANNOUNCE] New telephony recipe with Asterisk 11.x, OPUS codec, SRTP and libPRI
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
X-List-Received-Date: Wed, 20 Aug 2014 12:46:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi All,

I've made freely available a new telephony meta layer at

https://github.com/DICENetworks/meta-dicenetworks

In the new meta layer you can find Asterisk v11.9 recipe supporting
SRTP, OPUS Codec as well as libPRI, DAHDI kernel drivers and tools
and GSM library.

Feel free to suggest any improvements and fixes.

Cheers,
Roberto Fichera.

