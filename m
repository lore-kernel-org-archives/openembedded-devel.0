Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HvtL0-0007z4-MY
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2007 13:06:09 +0200
Received: by py-out-1112.google.com with SMTP id f47so180054pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2007 04:03:41 -0700 (PDT)
Received: by 10.64.153.4 with SMTP id a4mr723429qbe.1181127821261;
	Wed, 06 Jun 2007 04:03:41 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 22sm2640281nzn.2007.06.06.04.03.39;
	Wed, 06 Jun 2007 04:03:40 -0700 (PDT)
Date: Wed, 6 Jun 2007 14:03:38 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1709000488.20070606140338@gmail.com>
To: Matthias Hentges <oe@hentges.net>
In-Reply-To: <E1HvlNq-0004pN-I1@linuxtogo.org>
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget mode: An initscript to load the configured USB gadget module on boot
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
X-List-Received-Date: Wed, 06 Jun 2007 11:06:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello coredump2,

Wednesday, June 6, 2007, 5:36:26 AM, you wrote:

> usb-gadget-mode: Add usb-gadget mode: An initscript to load the
> configured USB gadget module on boot

[]

> +
> +CONF_FILE="/etc/usb-gadget.conf"
> +

[]

        This is nice, but can config go to /etc/default/ to not horde
/etc top-level? Thanks.


[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



